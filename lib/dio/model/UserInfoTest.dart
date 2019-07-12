import 'package:json_annotation/json_annotation.dart';

part 'UserInfoTest.g.dart';


@JsonSerializable()
class UserInfo extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'pics')
  List<String> pics;

  UserInfo(this.name,this.email,this.pics,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}


