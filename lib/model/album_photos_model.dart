import 'package:json_annotation/json_annotation.dart';

part 'album_photos_model.g.dart';

@JsonSerializable()
class AlbumPhotos {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  AlbumPhotos(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,required this.thumbnailUrl});

  factory AlbumPhotos.fromJson(Map<String, dynamic> json) =>
      _$AlbumPhotosFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumPhotosToJson(this);
}
