import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/model/album_model.dart';
import 'package:flutter_challenge/repository/album_repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'album_list_event.dart';
part 'album_list_state.dart';

class AlbumListBloc extends Bloc<AlbumListEvent, AlbumListState> {
  AlbumListBloc() : super(AlbumListInitial()) {
    on<AlbumListEvent>((event, emit) async {
      if (event is AlbumListGetEvent) {
        // print('function triggered');
        try {
          emit(AlbumListInitial());
          final client =
              RestClient(Dio(BaseOptions(contentType: "application/json")));
          List<AlbumList> albumList = await client.getAlbums();
          print("album list");
          print(albumList);
          emit(AlbumListLoaded(albumList));
        } catch (e) {
          emit(AlbumListError(e.toString()));
        }
      }
      if (event is AlbumListSearchEvent) {
        try {
          final client =
              RestClient(Dio(BaseOptions(contentType: "application/json")));
          List<AlbumList> albumList = event.search.isEmpty
              ? await client.getAlbums()
              : await client.getAlbumsByTitle(event.search);
          // print("album list");
          // print(albumList);
          emit(AlbumListLoaded(albumList));
        } catch (e) {
          emit(AlbumListError(e.toString()));
        }
      }
    });
  }
}
