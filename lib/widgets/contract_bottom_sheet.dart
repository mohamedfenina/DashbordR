import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dio_helper.dart';

class ContractBottomSheet extends StatefulWidget {
  const ContractBottomSheet({super.key, });

  @override
  State<ContractBottomSheet> createState() => _ContractBottomSheetState();
}

class _ContractBottomSheetState extends State<ContractBottomSheet> {
  bool show = false;
  List<bool>? isSelected ;
  List<dynamic> result = [];
  late Future<List<Map<String,dynamic>>> apiDataFuture;

  @override
  void initState() {
    apiDataFuture = getProducts();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'),
      ),
      backgroundColor: Colors.white,
      body:
      Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: ClipRRect(

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(


                    child: FutureBuilder(
                        future: apiDataFuture,
                        builder: (context,snapshot) {
                          var document = snapshot.data;
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            if (snapshot.error == 'connection timeout')
                              return Center(
                                child: Text('connection timeout'),
                              );
                            else {
                              return Center(
                                child: Text('connection other'),
                              );
                            }
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.data!.isEmpty || snapshot.error == 'Failed to load data') {
                            return Center(
                              child: Text('nodata found'),
                            );
                          }
                          else {




                            print('prob');

                            return Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                    child: ListView.separated(
                                        itemBuilder: (context,
                                            index) {
                                          return MaterialButton(
                                            onPressed: (){
                                              Navigator.pop(context,[document[index]['id'],document[index]['name']]);
                                            },
                                            child: Container(
                                              height: 55,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(child: Text(
                                                  document![index]['name'],
                                              style: GoogleFonts.poppins(
                                                color:Colors.black,
                                                fontSize: 16,

                                              ),)),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context,
                                            index) {
                                          return SizedBox(
                                            height: 20,
                                          );
                                        }, itemCount: document!.length),
                                  ),
                                ),

                              ],
                            );
                          }
                        }
                    ),
                  ),
                ),

              ],
            )

        ),


      ),


    );
  }

  Future<List<Map<String,dynamic>>> getProducts() async {
    try {
      final response = await DioHelper.getData(url: 'products',

      ); // Replace with your API endpoint
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data);
        List<Map<String,dynamic>> result = [];

        data.map((e) {
          Map<String, dynamic> contractData = {
            'id': e['_id'],
            'name': e['name'],
            'description': e['description'],
          };
          print(contractData);
          result.add(contractData);

        }).toList();
print(result);
        return result;

      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print(error);
      if (error is DioException && (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.connectionError)){
        // Handle connection timeout error
        return Future.error('connection timeout');
      }
      else if (error is DioException) {
        return Future.error('connection other');
      }


      // print(error.response);
      // print('Error message: ${error.error}');
      // print('Error description: ${error.message}');
      else {
        return Future.error('connection other');
      }
    }
  }
}





// Scaffold.of(context).showBottomSheet(
// enableDrag: false,
// backgroundColor: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(16.0),
// topRight: Radius.circular(16.0),
// ),
// ),
//
// (BuildContext context) {
// return FractionallySizedBox(
// heightFactor: 0.7,
// child: Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(16.0),
// topRight: Radius.circular(16.0),
// ),
// ),
// child: ClipRRect(
//
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(16.0),
// topRight: Radius.circular(16.0),
// ),
// child: Scaffold(
// key: scaffoldKey,
// appBar: ProfileAppBar(
// text: 'حدد الليالي المراد شراءها',
// context: context,
// cancel: (){
// setState(() {
// show = false;
// });
// },
//
// ),
// backgroundColor: Colors.white,
// body: Column(
// children: [
// Expanded(
// child: Container(
// padding: EdgeInsets.symmetric(vertical: 5,horizontal: defaultPadding),
//
// child: FutureBuilder(
// future: getContractDays(),
// builder: (context,snapshot) {
// var document = snapshot.data;
// if (snapshot.hasError) {
// print(snapshot.error);
// if (snapshot.error == 'connection timeout')
// return Center(
// child: ConnectionProbleme(pressed: () {
// setState(() {
// // _refreshData = true;
// });
// }),
// );
// else {
// return Center(
// child: UndifinedProbleme(pressed: () {
// setState(() {
// // _refreshData = true;
// });
// }),
// );
// }
// }
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(
// child: CircularProgressIndicator());
// }
// if (snapshot.data!.isEmpty || snapshot.error == 'Failed to load data') {
// return NodataFound(pressed: (){
// setState(() {
// // _refreshData = true;
// });
// },);
// }
// else {
// isSelected = List.generate(document!.length, (index) => false);
// print('prob');
//
// return ListView.separated(
// itemBuilder: (context,
// index) {
// return ContractOptionCard(
// pressed: (){
// setState(() {
// print(isSelected![index]);
// isSelected![index] = true;
// print(isSelected![index]);
// });
// },
// date: document![index],
// selected: isSelected![index],
// );
// },
// separatorBuilder: (context,
// index) {
// return SizedBox(
// height: 20,
// );
// }, itemCount: document.length);
// }
// }
// ),
// ),
// ),
//
// ],
// )
// ),
// ),
//
//
// ),
// );
// },
// );




