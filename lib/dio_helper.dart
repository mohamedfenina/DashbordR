


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static String? basicAuth;
  static late  Dio dio;
  static String baseUrl = "http://localhost:3000/";
  static String? error = null;
  static String? errorDescreption = null;

  static init(GlobalKey<ScaffoldMessengerState> _scaffoldKey){
    dio = Dio(

        BaseOptions(
          baseUrl: baseUrl,
          // receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),




        )
    );




    // dio.options.followRedirects = true;
    // dio.options.maxRedirects = 5; // You can adjust the maximum number of redirects
    // dio.options.extra['withCredentials'] = true;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Print the request details
          print('Sending request: $options');
          print('Method: ${options.method}');
          print('URL: ${options.uri}');
          print('Headers: ${options.headers}');
          print('Body: ${options.data}');

          // Continue with the request
          return handler.next(options);
        },



        onError: (DioException e, ErrorInterceptorHandler handler) {
          if (e.response?.statusCode == 302) {
            // Handle the redirection response
            String? redirectionMessage = e.response?.data.toString();
            print('Redirection message: $redirectionMessage');
          } else {
            // Handle other DioError cases
            print('Error: $e');
          }

          print('""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""');
          // print('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
          // print('ERROR[${e.response?.statusCode}');

          print('error ${e.response?.statusCode  }');
          // print('error ${e.response!.data}');
          // print(e.response?.data['message']);
          // print(e.response);

          // switch(e.response?.statusCode) {
          //   case 303: {
          //     error = "Authentication Fail";
          //     errorDescreption = "Please login again";
          //   }
          //   break;

          //   case 422: {
          //     error = e.response?.data['errors'];
          //     errorDescreption = "Please login again";
          //   }
          //   break;
          //   case 403: {
          //     error = "Authentication Fail";
          //     errorDescreption = "Please login again";
          //   }
          //   break;
          //   case 401: {
          //     error = "Authentication Fail";
          //     errorDescreption = "Please login again";
          //   }
          //   break;
          //   case 404: {
          //     error = "Not Found";
          //
          //   }
          //   break;
          //   case 500: {
          //     error = "Internal server Error";
          //
          //   }
          //   break;
          //   case 508: {
          //     error = "Time Out";
          //
          //   }
          //   break;
          //
          //   default: {
          //    error = "Error";
          //   }
          //   break;
          // }
          DioException errorWithMessage = DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            error: {
              'message': e.response?.data['errors'],
              'msg': e.message,
              'code':e.response?.statusCode,
            },
            type: e.type,
          );

          return handler.next(errorWithMessage);

        },
        // if (error != null) {
        //   // show SnackBar if error field is not null
        //   _scaffoldKey.currentState!.showSnackBar(SnackBar(content:
        //   Column(
        //     children: [
        //       Text("$error"),
        //       errorDescreption != null ? Text("$errorDescreption") : Text("test"),
        //     ],
        //   ),
        //     backgroundColor: Colors.redAccent,
        //     duration: Duration(seconds: 3),
        //
        //
        //   ) );
        // }

        //   // return handler.next(e);
        // },

      ),
    );




  }

  static Future<Response> getData ({
    required String url,
    Object? data,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,

  }) async {
    return await dio.get(url,data:data,queryParameters: query,
        options: Options(headers: header));
  }
  static Future<Response> postData ({
    required String url,
    Object? data,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,


  }) async {
    return await dio.post(url, data:data,queryParameters: query,
        options: Options(headers: header));
  }
  static Future<Response> putData ({
    required String url,
    Object? data,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,


  }) async {
    return await dio.put(url, data:data,queryParameters: query,
        options: Options(headers: header));
  }


  static Future<Response> postDatat ({
    required String url,
    required Object data


  }) async {
    return await dio.post(url, data:data,options: Options(headers: {
      'Authorization': basicAuth
    }));
  }

}