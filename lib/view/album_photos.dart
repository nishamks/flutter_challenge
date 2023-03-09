import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/model/album_model.dart';

import '../controller/album_photo_list/album_photo_list_bloc.dart';

class AlbumPhotosView extends StatelessWidget {
  final AlbumList albumData;
  const AlbumPhotosView({super.key, required this.albumData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AlbumPhotoListBloc()..add(AlbumPhotoListGetEvent(albumData.id)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<AlbumPhotoListBloc, AlbumPhotoListState>(
            builder: (context, state) {
              return state is AlbumPhotosError
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Error'),
                      ],
                    )
                  : state is AlbumPhotosLoading || state is AlbumPhotosInitial
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: ListView.builder(
                              itemCount: (state as AlbumPhotosLoaded)
                                  .albumPhotos
                                  .length,
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: InkWell(
                                      onTap: () async {
                                        await showDialog(
                                            context: context,
                                            builder: (_) => imageDialog((state as AlbumPhotosLoaded)
                                                .albumPhotos[index]
                                                .title,  (state as AlbumPhotosLoaded)
                                                .albumPhotos[index]
                                                .url, context));
                                      },
                                      child: Card(
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [

                                                Image.network(
                                                  (state as AlbumPhotosLoaded)
                                                      .albumPhotos[index]
                                                      .thumbnailUrl,
                                                  height: 150,
                                                  width: double.infinity,
                                                ),
                                                SizedBox(height: 20,),
                                                Text((state as AlbumPhotosLoaded)
                                                    .albumPhotos[index]
                                                    .title)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                        );
            },
          ),
        ),
      ),
    );
  }

  Widget imageDialog(text, path, context) {
    return Dialog(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 4/3,
            child: Image.network(
              '$path',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close_rounded),
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );}
}
