import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:learnflutter/demo1/model/News.dart';
import 'package:http/http.dart' as http;

const apikey = "56f8f53330664a669852560995ac4972";

class NewsApi {
  static Future<NewsList> getHeadlines(
      {String category: "general", int page: 0}) async {
    final response = await http.get(
//        "https://newsapi.org/v2/top-headlines?country=us&apiKey=56f8f53330664a669852560995ac4972&page=1&category=general");
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apikey&page=$page&category=$category");
    return compute(parseResult, response.body);
  }

  static NewsList parseResult(String respond) {
    return NewsList.fromJson(json.decode(respond));
  }
}
