// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumPhotos _$AlbumPhotosFromJson(Map<String, dynamic> json) => AlbumPhotos(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$AlbumPhotosToJson(AlbumPhotos instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
