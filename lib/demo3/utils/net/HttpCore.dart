
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:learnflutter/demo3/utils/net/Api.dart';
import 'package:learnflutter/demo3/DebugConfig.dart';

class HttpCore {
  factory HttpCore() => _getInstance();

  static HttpCore get instance => _getInstance();
  static HttpCore _instance;

  HttpCore._internal();

  static HttpCore _getInstance() {
    if (_instance == null) {
      _instance = new HttpCore._internal();
    }
    return _instance;
  }

  static const String GET = "get";
  static const String POST = "post";

  var dio = new Dio(new Options(
      baseUrl: Api.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 10000,
      headers: {"user-agent": "dio", "api": "1.0.0"},
      /*contentType: ContentType.JSON,
      responseType: ResponseType.PLAIN*/));

  //get请求
  void get(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: GET, params: params, errorCallBack: errorCallBack);
  }

  //post请求
  void post(String url, Function callBack,
      {Map<String, String> params, Function errorCallBack}) async {
    _request(url, callBack,
        method: POST, params: params, errorCallBack: errorCallBack);
  }

  void _request(String url, Function callBack,
      {String method,
      Map<String, String> params,
      Function errorCallBack}) async {
//    dio.onHttpClientCreate = (HttpClient client) {
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY 172.23.235.153:8888";
//      };
//    };
    String errorMsg = "";
    int statusCode;
    try {
      Response response;
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          params.forEach((key, value) {
            sb.write("$key" + "=" + "$value" + "&");
          });
          String paramStr = sb.toString();
          paramStr = paramStr.substring(0, paramStr.length - 1);
          url += paramStr;
        }
        response = await dio.get(url);
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(url, data: params);
        } else {
          response = await dio.post(url);
        }
      }

      statusCode = response.statusCode;
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }
      if (callBack != null) {
        String res2Json  = json.encode(response.data);
        Map<String,dynamic> map=json.decode(res2Json);
        callBack(map["data"]);
      }
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  void _handError(Function errorCallBack, String errorMsg) {
    if (errorCallBack != null) {
      errorCallBack(errorMsg);
    }
  }
}
