part of 'album_photo_list_bloc.dart';

abstract class AlbumPhotoListEvent extends Equatable {
  const AlbumPhotoListEvent();

  @override
  List<Object> get props => [];
}

class AlbumPhotoListGetEvent extends AlbumPhotoListEvent {
  int albumId;
  AlbumPhotoListGetEvent(this.albumId);
}
