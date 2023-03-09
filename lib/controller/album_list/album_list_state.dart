part of 'album_list_bloc.dart';

@immutable
abstract class AlbumListState {
  // @override
  // // TODO: implement props
  // List<Object?> get props => [];
}

class AlbumListInitial extends AlbumListState {}

class AlbumListLoading extends AlbumListState {}

class AlbumListLoaded extends AlbumListState {
  List<AlbumList> albumList;
  AlbumListLoaded(this.albumList);
}

class AlbumListError extends AlbumListState {
  final String error;

  AlbumListError(
    this.error,
  );
}
