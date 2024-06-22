

import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/numeric/pie.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:d_chart/ordinal/combo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/constants.dart';
import '../../dio_helper.dart';
import '../custom_appbar.dart';

class DashboardContent extends StatelessWidget{
  const DashboardContent({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(
              height: appPadding,
            ),
            FutureBuilder(
                future: getDashbordData(),
                builder: (context, snapshot) {
                  var document = snapshot.data;
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}',));

                  }



                  if (snapshot.connectionState == ConnectionState.waiting ) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.data!.isEmpty){
                    return Center(
                      child: Text('Aucune donnée disponible',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 50
                        ),),
                    );
                  }
                  else{
                    return Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width/2 - (appPadding * 10),
                          height: MediaQuery.sizeOf(context).height - (appPadding * 10),
                          child: DChartBarO(

                            groupList: [
                              OrdinalGroup(id: 'chart', data: [
                                OrdinalData(domain: 'Total Rates', measure: document![0]),
                                OrdinalData(domain: 'Avg rates', measure: document![1]),
                              ],
                                color: Colors.blueAccent,
                                seriesCategory: 'chart',
                              ),

                            ],),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width/2 - (appPadding * 10),
                          height: MediaQuery.sizeOf(context).height - (appPadding * 10),
                          child: DChartBarO(
                            groupList: [
                              OrdinalGroup(id: 'chart', data: [
                                OrdinalData(domain: 'Total Comments', measure: document[2]),
                                OrdinalData(domain: 'Avg Comments Length', measure: document[3]),
                              ],
                                color: Colors.greenAccent,
                                seriesCategory: 'chart',),

                            ],
                          ),
                        ),

                      ],
                    );
                  }

                }
            ),


          ],
        ),
      ),
    );
  }
  Future<List<dynamic>> getDashbordData() async {
    try {
      final response = await DioHelper.getData(url: 'analytics/rates');

      if (response.statusCode == 200) {
        final dynamic data = response.data;
        print(data['totalRates']);
        print(data);
        print(data[0]);
        List<dynamic> result = [];
        result.add(data['totalRates']);
        result.add(double.parse(data['averageRate']));
        final response1 = await DioHelper.getData(url: 'analytics/comments');
        if (response1.statusCode == 200) {
          final dynamic data1 = response1.data;

          result.add(data1['totalComments']);
          result.add(double.parse(data1['averageLength']));
          print(result);
          return result;
        }
        else{
          return result;
        }



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