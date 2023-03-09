import 'package:faker/faker.dart';
import 'package:flutter_challenge/model/album_model.dart';
import 'package:flutter_challenge/model/album_photos_model.dart';




List<AlbumList> generateMockAlbumPhotosList(){
  var mockList = <AlbumList>[];
  for(int index =0; index < 20; index ++){
    mockList.add(AlbumList(userId: faker.randomGenerator.integer(100), id: faker.randomGenerator.integer(100), title: faker.lorem.sentence()));
  }
  return mockList;
}

AlbumPhotos generateMockAlbumPhotos() {
  final faker = Faker();
  return AlbumPhotos(
    albumId: faker.randomGenerator.integer(100),
    id: faker.randomGenerator.integer(100),
    title: faker.lorem.sentence(),
    url: faker.internet.httpUrl(),
    thumbnailUrl: faker.internet.httpUrl(),
  );


}