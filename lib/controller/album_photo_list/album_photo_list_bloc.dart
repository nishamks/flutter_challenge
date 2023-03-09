import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../repository/album_repository.dart';
import '../../model/album_photos_model.dart';

part 'album_photo_list_event.dart';
part 'album_photo_list_state.dart';

class AlbumPhotoListBloc extends Bloc<AlbumPhotoListEvent, AlbumPhotoListState> {
  AlbumPhotoListBloc() : super(AlbumPhotosInitial()) {
    on<AlbumPhotoListEvent>((event, emit) async{
      if (event is AlbumPhotoListGetEvent) {
        print('function triggered');
        try {
          emit(AlbumPhotosInitial());
          final client =
              RestClient(Dio(BaseOptions(contentType: "application/json")));
          List<AlbumPhotos> albumPhotos = await client. getPhotosByAlbum(event.albumId);
          print("album list");
          print(AlbumPhotos);
          emit(AlbumPhotosLoaded(albumPhotos));
        } catch (e) {
          emit(AlbumPhotosError(e.toString()));
        }
      }
    });
  }
}
