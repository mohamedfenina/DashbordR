import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/View/History/Historique.dart';
import 'package:dashboard/View/History/task_filter_component.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../components.dart';
import '../../dio_helper.dart';
import '../../widgets/contract_bottom_sheet.dart';


class DoneTaskScreen extends StatefulWidget {
  const DoneTaskScreen({super.key});

  @override
  State<DoneTaskScreen> createState() => _DoneTaskScreenState();
}

class _DoneTaskScreenState extends State<DoneTaskScreen> {
  DateTime firstDate =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  DateTime lastDate =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  List<String> employe = [];
  List<String> product = [];
TextEditingController ProductController = TextEditingController();
String productId = '';
  late Future<List<Map<String, dynamic>>> ApiDataFuture ;
  @override
  void initState() {
    ApiDataFuture = getCommentData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:  ApiDataFuture , // Use the function to get the stream
        builder: ( context,  snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.data!.isEmpty){
            return Column(
              children: [
                defaultFormField(
                    readonly: true,

                    tab: (){
                      showModalBottomSheet(
                        isScrollControlled: true,
                        enableDrag: false,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                              heightFactor: 0.7,
                              child: ContractBottomSheet());
                        },
                      ).then((value) {
                        if(value != null){
                          ProductController.text = value[1];
                          productId = value[0].toString();
                         print('tesst');
                         setState(() {
                           ApiDataFuture = getCommentDataById();
                         });



                        }
                      });
                    },
                    contoller: ProductController,
                    type: TextInputType.text,
                    validate: (value){
                      if(value.isEmpty){
                        return'le nom est manquant ';
                      }
                    },
                    label: 'Select Product Name',
                    prefix: Icons.propane_tank_rounded
                ),
                const Center(
                  child: Text('Aucune donnée disponible',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 50
                    ),),
                ),
              ],
            );
          }


          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20,);
            },
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var document = snapshot.data![index];

              var date = (document['date']);


              bool showDateHeader = index == 0 || date.day != snapshot.data![index - 1]['date'].day;




              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(index == 0 )
                    defaultFormField(
                        readonly: true,

                        tab: (){
                          showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: false,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                  heightFactor: 0.7,
                                  child: ContractBottomSheet());
                            },
                          ).then((value) {
                            if(value != null){
                              ProductController.text = value[1];
                              productId = value[0].toString();
                              print('tesst');
                              setState(() {
                                ApiDataFuture = getCommentDataById();

                              });

                            }
                          });
                        },
                        contoller: ProductController,
                        type: TextInputType.text,
                        validate: (value){
                          if(value.isEmpty){
                            return'le nom est manquant ';
                          }
                        },
                        label: 'Select Product Name',
                        prefix: Icons.propane_tank_rounded
                    ),
                  if (showDateHeader)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat('d MMMM yyyy').format(date),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  HistoriqueItem(

                    document: document,

                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }



  Future<List<Map<String, dynamic>>> getCommentData() async {
    try {
      final response = await DioHelper.getData(url: 'history/comments',



      ); // Replace with your API endpoint
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<Map<String,dynamic>> result = [];
        data.map((e) {
          Map<String, dynamic> contractData = {
            'id': e['_id'],
            'user': e['commentOwner'],
            'product': e['product'],
            'content':censorText(e['content'], sensitiveWords),
            'date': DateTime.parse(e['createdAt']),

          };
          result.add(contractData);
        }).toList();


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
  Future<List<Map<String, dynamic>>> getCommentDataById() async {
    try {
      final response = await DioHelper.getData(url: 'comments/getCommentsByProduct/$productId',



      ); // Replace with your API endpoint
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<Map<String,dynamic>> result = [];
        data.map((e) {
          Map<String, dynamic> contractData = {
            'id': e['_id'],
            'user': e['commentOwner'],
            'product': e['product'],
            'content':censorText(e['content'], sensitiveWords),
            'date': DateTime.parse(e['createdAt']),

          };
          result.add(contractData);
        }).toList();


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





  List<String> sensitiveWords = ["sensitive", "bad","fuck"];
  String censorText(String text, List<String> sensitiveWords) {
    for (var word in sensitiveWords) {
      text = text.replaceAll(RegExp(r"\b" + word + r"\b"), '*' * word.length);
    }
    return text;
  }

}




  
  
