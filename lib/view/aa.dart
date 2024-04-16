import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monday15/model/newsapimodel.dart';

class HomeScreenController with ChangeNotifier {
  NewsApiResModel ? resmodel;
  bool isloading = false;
  Future getdata() async {
    isloading = true;
    notifyListeners();
    //step 1
    Uri url = Uri.parse(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=9cd3e337b1f041749fde5de4043474fe");

    //step 2
    var res = await http.get(url);

    //step 3
    if (res.statusCode == 200) {
      //step 4 decode
      var decodedata = jsonDecode(res.body);

      //step 5 convert to model class
      resmodel = NewsApiResModel.fromJson(decodedata);
      //step 6 state update
    } else {
      print("failed");
    }
    isloading = false;
    notifyListeners();
  }
}