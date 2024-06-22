import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/View/History/Historique.dart';
import 'package:dashboard/View/History/task_filter_component.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../components.dart';
import '../../dio_helper.dart';



class PendingTaskScreen extends StatefulWidget {
  PendingTaskScreen({super.key});

  @override
  State<PendingTaskScreen> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<PendingTaskScreen> {

  DateTime firstDate =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  DateTime lastDate =DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  List<String> employe = [];
  List<String> product = [];
  String? selectedEmploye;
  String? selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getRateData(), // Use the function to get the stream
        builder: ( context,  snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.data!.isEmpty ){
            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(context: context,

                      builder: (context) {
                        return TaskFilterComponent(
                          categorieList: employe,
                          onApplyFilter: handleFilter,
                          done: true,
                          firstdate: firstDate,
                          lastDate: lastDate,
                          category: selectedEmploye,
                          categorieList1: product,
                          category1: selectedProduct,


                        );
                      },);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: mainColor,
                        width: 2,),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: mainColor, size: 35),
                          SizedBox(width: 5,),
                          Text('Rate ?',
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w800
                            ),),
                          Spacer(),
                          Icon(Icons.filter_list_rounded,
                              color: mainColor,
                              size: 35),
                        ],
                      ),
                    ),
                  ),
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


              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(index == 0)
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(context: context,

                          builder: (context) {
                            return TaskFilterComponent(
                              categorieList1: product,
                              categorieList:employe,
                              category1: selectedProduct,
                              onApplyFilter: handleFilter,
                              done: true,
                              firstdate: firstDate,
                              lastDate: lastDate,
                              category: selectedEmploye,


                            );
                          },);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: mainColor,
                            width: 2,),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: mainColor, size: 35),
                              SizedBox(width: 5,),
                              Text('Rate ?',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800
                                ),),
                              Spacer(),
                              Icon(Icons.filter_list_rounded,
                                  color: mainColor,
                                  size: 35),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (showDateHeader)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        DateFormat('d MMMM yyyy').format(date),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight
                            .bold),
                      ),
                    ),
                  HistoriqueItem2(

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

  Future<List<Map<String, dynamic>>> getRateData() async {
    try {
      final response = await DioHelper.getData(url: 'history/rates',



      ); // Replace with your API endpoint
      print(response);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        List<Map<String,dynamic>> result = [];
        data.map((e) {
          Map<String, dynamic> contractData = {
            'id': e['_id'],
            'user': e['rateOwner'],
            'product': e['product'],
            'rate': e['rating'],
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






  void handleFilter(DateTime firstDate, DateTime lastDate,
      String? selectedValue, String? selectedValue1) {
    setState(() {
      this.firstDate = firstDate;
      this.lastDate = lastDate;
      selectedEmploye = selectedValue;
      selectedProduct = selectedValue1;
    });
  }
}