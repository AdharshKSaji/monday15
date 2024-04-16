// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:monday15/model/sportsapimodel.dart';
// class SportsApiController with ChangeNotifier{
// SportsApiResModel?resSprtsModel;
// bool isLoading=false;

// Future getDatas() async {
//   isLoading=true;
//   Uri url =Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=9cd3e337b1f041749fde5de4043474fe");
//   var res = await http. get(url);
//   if(res.statusCode==200

//   ){
//     var decodedDatas=jsonDecode(res.body);
//     resSprtsModel = SportsApiResModel.fromJson(decodedDatas);

//   }
// else{
//   print("failed");
// }isLoading = false;
//     notifyListeners();
// }
// }