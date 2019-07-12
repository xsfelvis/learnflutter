// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfoTest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['name'] as String, json['email'] as String,
      (json['pics'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'pics': instance.pics
    };
