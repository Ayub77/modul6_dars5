import 'dart:convert';

import 'package:http/http.dart';
import 'package:modul6_dars5/madel/post_model.dart';

class Network {
  static Map<String,String> headers = {'Coutent-Type':'application/json; charset=UTF-8'};
  static String BASE = "dummy.restapiexample.com";

  static String API_List = "api/v1/employees";
  static String API_Post = "/api/v1/create";
  static String API_Update = "/api/v1/update/"; //{id}
  static String API_Delete = "/api/v1/delete/"; //{id}


  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    try{
    var response = await get(uri,headers: headers);
    if (response.statusCode == 200) {
    return Future.value(response.body);
    }

    }catch(e){
      // print(e);
      print('ERROR');
    }finally{
     print('-----');
    }
    return Future.value('');
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    try{
    var response = await post(uri,headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
    return Future.value(response.body);
    }

    }catch(e){
      // print(e);
      print('ERROR');
    }finally{
     print('-----');
    }
    return Future.value('');
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    try{
    var response = await put(uri,headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 ) {
    return Future.value(response.body);
    }

    }catch(e){
      // print(e);
      print('ERROR');
    }finally{
     print('-----');
    }
    return Future.value('');
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    try{
    var response = await delete(uri,headers: headers);
    if (response.statusCode == 200) {
    return Future.value(response.body);
    }

    }catch(e){
      // print(e);
      print('ERROR');
    }finally{
     print('-----');
    }
    return Future.value('');
  }

  static Map<String,String> paramsEmpty(){
    Map<String,String> params =new Map();
    return params;
  }

   static Map<String,String> paramsCreate(Post post){
    Map<String,String> params =new Map();

  params.addAll(	{
    "name": post.name,
    "salary":post.salary,
    "age":post.age
    });

    return params;
  }

  static Map<String,String> paramsUpdate(Post post){
    Map<String,String> params =new Map();

  params.addAll(	{
    "name": post.name,
    "salary":post.salary,
    "age":post.age
    });

    return params;
  }
}
