
import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()
class AlbumList {
  int userId;
  int id;
  String title;

  AlbumList(
      {required this.userId,
     required this.id,
     required this.title,
     });

  factory AlbumList.fromJson(Map<String, dynamic> json) => _$AlbumListFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumListToJson(this);
}
