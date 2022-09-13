import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:taskes_project/home_Api/product_model.dart';

class HomeProvider with ChangeNotifier{
  HomeModel ? data;
  String ? token;
  Future<dynamic>getAllData()async{
    var dio=Dio();
    dio.options.headers ={
      'lang':'arabic',
      "contant_type":"app/json",
      "Authorization":token,
    };
     final respone = await dio.get("https://student.valuxapps.com/api/home");
     print(respone.data.toString());
    data=HomeModel.fromJson(respone.data);
    notifyListeners();
   
  }
} 

