import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/album_model.dart';
import '../model/album_photos_model.dart';

part 'album_repository.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/albums")
  Future<List<AlbumList>> getAlbums();

  @GET("/albums?title={title}")
  Future<List<AlbumList>> getAlbumsByTitle(@Path() String title);

  @GET("/albums/{id}/photos")
  Future<List<AlbumPhotos>> getPhotosByAlbum(@Path() int id);
}
