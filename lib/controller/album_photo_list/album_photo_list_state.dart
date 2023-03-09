part of 'album_photo_list_bloc.dart';

abstract class AlbumPhotoListState extends Equatable {
  const AlbumPhotoListState();
  
  @override
  List<Object> get props => [];
}

class AlbumPhotosInitial extends AlbumPhotoListState {}

class AlbumPhotosLoading extends AlbumPhotoListState {}

class AlbumPhotosLoaded extends AlbumPhotoListState {
  List<AlbumPhotos> albumPhotos;
  AlbumPhotosLoaded(this.albumPhotos);
}

class AlbumPhotosError extends AlbumPhotoListState {
  final String error;

  AlbumPhotosError(
    this.error,
  );
}

