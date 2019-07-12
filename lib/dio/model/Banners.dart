import 'package:json_annotation/json_annotation.dart';

part 'Banners.g.dart';


List<BannerData> getBannersList(List<dynamic> list){
  List<BannerData> result = [];
  list.forEach((item){
    result.add(BannerData.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class BannerData extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  BannerData(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory BannerData.fromJson(Map<String, dynamic> srcJson) => _$BannerDataFromJson(srcJson);
}


