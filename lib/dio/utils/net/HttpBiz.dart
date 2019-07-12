import 'package:learnflutter/dio/model/Banners.dart';
import 'package:learnflutter/dio/utils/net/HttpCore.dart';
import 'package:learnflutter/dio/utils/net/Api.dart';
import 'package:learnflutter/dio/utils/toast/ToastUtil.dart';

class HttpBiz {
  factory HttpBiz() => _getInstance();

  static HttpBiz get instance => _getInstance();
  static HttpBiz _instance;

  HttpBiz._internal();

  static HttpBiz _getInstance() {
    if (_instance == null) {
      _instance = new HttpBiz._internal();
    }
    return _instance;
  }

  //banner
  List<BannerData> getBannerItems() {
    HttpCore.instance.get(Api.BASE_URL + Api.HOME_BANNER, (data) {
//      ToastUtils.showShort("" + getBannersList(data)[0].desc);
      List<BannerData> banners = getBannersList(data);
      return banners;
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
      return null;
    });
  }
}
