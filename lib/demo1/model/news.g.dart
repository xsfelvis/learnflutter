// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['author'] as String,
      json['title'] as String,
      json['description'] as String,
      json['url'] as String,
      json['urlToImage'] as String,
      json['publishedAt'] as String,
      json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'source': instance.source
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(json['id'] as String, json['name'] as String);
}

Map<String, dynamic> _$SourceToJson(Source instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

NewsList _$NewsListFromJson(Map<String, dynamic> json) {
  return NewsList(
      json['status'] as String,
      json['totalResults'] as int,
      (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : News.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['code'],
      json['message']);
}

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
      'code': instance.code,
      'message': instance.message
    };
