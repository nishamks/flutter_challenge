part of 'album_list_bloc.dart';

@immutable
abstract class AlbumListEvent {
  @override
  List<Object?> get props => [];
}

class AlbumListGetEvent extends AlbumListEvent {}

class AlbumListSearchEvent extends AlbumListEvent {
  String search;
  AlbumListSearchEvent(this.search);
}
