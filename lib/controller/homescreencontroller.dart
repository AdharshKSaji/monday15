import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:monday15/model/newsapimodel.dart';

class HomeScreenController with ChangeNotifier {

  List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];
   int onSelectedCategoryindex=0;
  NewsApiResModel ?resCategory;
  
  
  // NewsApiResModel ? resModel;
  bool isloading = false;
  Future getCategoryData() async {
    isloading = true;
    notifyListeners();
    //step 1
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=${categories[onSelectedCategoryindex]}&apiKey=9cd3e337b1f041749fde5de4043474fe");

    //step 2
    var res = await http.get(url);

     //step 3
    if (res.statusCode == 200) {
      //step 4 decode
      var decodedata = jsonDecode(res.body);

      //step 5 convert to model class
      resCategory = NewsApiResModel.fromJson(decodedata);
      //step 6 state update
    } else {
      print("failed");
    }
    isloading = false;
    notifyListeners();
  }

  // on category selection
 CategorySelection(int value){
  onSelectedCategoryindex =value;
  notifyListeners();
  getCategoryData();

 }
  


  }
