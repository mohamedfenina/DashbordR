import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../dio_helper.dart';
import '../../snack_bar/snack_bar.dart';



class CategorieProduction{



  SetRate(BuildContext context,String productId,rate) async {

    try {
      final response = await DioHelper.postData(url: 'rates',
        data: {"rateOwner" : "667609e104c497462b5963d2",
          "rating" : rate.toString(),
          "product":productId},
      ); // Replace with your API endpoint

      print(response.statusCode);
      print(response.data);
      print(response);
      if (response.statusCode == 200) {
        Navigator.pop(context);

        // ShowSuccesSnackBar(context, 'تم سحب من المحفظة بنجاح');
        // Future.delayed(Duration(seconds: 2)).then((value) {
        //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WalletLayout(),));
        // });
      }


      else {

        ShowErrorSnackBar(context, 'erroe while adding');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('zqs');
      print(error);
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.connectionError)) {
        // Handle connection timeout error

        ShowErrorSnackBar(context, 'connection probleme');
        return Future.error('connection timeout');
      }
      else if (error is DioException) {
        print(error.response!.statusCode);
        if (error.response!.statusCode == 400) {

          ShowErrorSnackBar(context, 'erroe while adding');
        }
        else {

          ShowErrorSnackBar(context, 'erroe while adding');
          return Future.error('connection $error');
        }
        print(error);
      }


      // print(error.response);
      // print('Error message: ${error.error}');
      // print('Error description: ${error.message}');
      else {
        ShowErrorSnackBar(context, 'erroe while adding');

        return Future.error('connection other');
      }
    }
  }
  putRate(BuildContext context,String id ,String productId,rate) async {

    try {
      final response = await DioHelper.putData(url: 'rates/$id',
        data: {
          "rateOwner" : "667609e104c497462b5963d2",
          "rating" : rate.toString(),
          "product":productId},
      ); // Replace with your API endpoint

      print(response.statusCode);
      print(response.data);
      print(response);
      if (response.statusCode == 200) {
        Navigator.pop(context);

        // ShowSuccesSnackBar(context, 'تم سحب من المحفظة بنجاح');
        // Future.delayed(Duration(seconds: 2)).then((value) {
        //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WalletLayout(),));
        // });
      }


      else {

        ShowErrorSnackBar(context, 'erroe while adding');
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('zqs');
      print(error);
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.connectionError)) {
        // Handle connection timeout error

        ShowErrorSnackBar(context, 'connection probleme');
        return Future.error('connection timeout');
      }
      else if (error is DioException) {
        print(error.response!.statusCode);
        if (error.response!.statusCode == 400) {

          ShowErrorSnackBar(context, 'erroe while adding');
        }
        else {

          ShowErrorSnackBar(context, 'erroe while adding');
          return Future.error('connection $error');
        }
        print(error);
      }


      // print(error.response);
      // print('Error message: ${error.error}');
      // print('Error description: ${error.message}');
      else {
        ShowErrorSnackBar(context, 'erroe while adding');

        return Future.error('connection other');
      }
    }
  }


  Future<List<Map<String, dynamic>>> getRateData() async {
    try {
      final response = await DioHelper.getData(url: 'rates',



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
  Future<Map<String, dynamic>> getDataById(String id) async {
    try {
      final response = await DioHelper.getData(url: 'rates/$id',



      ); // Replace with your API endpoint
      print(response);
      if (response.statusCode == 200) {
        final dynamic data = response.data;
        Map<String,dynamic> result ={
          'id': data['_id'],
          'user': data['rateOwner']['_id'],
          'product': data['product']['name'],
          'productId': data['product']['_id'],
          'rate': data['rating'],
        };



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


  Stream<QuerySnapshot> getCategorieStream()  {
    return  FirebaseFirestore.instance
        .collection('Rate')
        .snapshots();


  }











//////////////////////////



  Delete(String? document) async {

    final collection = FirebaseFirestore.instance.collection('Rate');

    await collection
        .doc(document) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) async {


      print('Documents deleted successfully');



    }).catchError((error) {

      print('Delete failed: $error');
    } );

  }

  // Update(String name,String description,String time) {
  //   print('tttttttttttttttttttttttttttttttttttttttttttssssss');
  //   var collection = FirebaseFirestore.instance.collection('TaskData');
  //    collection.doc().update({"name":'aaa'});
  // }
  Future<void> update(String? document ,String productName,String userName,int rate) async {




    var collection = FirebaseFirestore.instance.collection('Rate');

    await collection.doc(document).update({
      "ProductName": productName,
      "UserName":userName,
      "rate": rate,

    }).then((value) {
      print ("updated");
    }).catchError((error){
      print(error);

    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> getDocumentById(String? documentId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore.instance.collection('Rate').doc(documentId).get();
      if (document.exists) {
        // Document found
        return document;
      } else {
        // Document doesn't exist
        return null;
      }
    } catch (e) {
      print('Error getting document by ID: $e');
      return null;
    }
  }






}