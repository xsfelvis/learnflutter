// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['by'] as String,
      json['descendants'] as int,
      json['id'] as int,
      (json['kids'] as List)?.map((e) => e as int)?.toList(),
      json['score'] as int,
      json['time'] as int,
      json['title'] as String,
      json['type'] as String,
      json['url'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'kids': instance.kids,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
