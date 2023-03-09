import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/model/album_photos_model.dart';

import '../controller/album_list/album_list_bloc.dart';
import 'album_photos.dart';

class AlbumListView extends StatelessWidget {
  const AlbumListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumListBloc()..add(AlbumListGetEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<AlbumListBloc, AlbumListState>(
            builder: (context, state) {
              return state is AlbumListError
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text('Error')),
                      ],
                    )
                  : state is AlbumListLoading || state is AlbumListInitial
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onChanged: (text) {
                                        context
                                            .read<AlbumListBloc>()
                                            .add(AlbumListSearchEvent(text));
                                      },
                                      decoration: const InputDecoration(
                                        hintText: "Search by title",
                                        icon: Icon(Icons.search),

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: (state as AlbumListLoaded)
                                        .albumList
                                        .length,
                                    itemBuilder: (context, index) => InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AlbumPhotosView(
                                                          albumData: (state
                                                                  as AlbumListLoaded)
                                                              .albumList[index],
                                                        )));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                10),
                                            child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: double.infinity,

                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                        (state as AlbumListLoaded)
                                                            .albumList[index]
                                                            .title),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ],
                          ),
                        );
            },
          ),
        ),
      ),
    );
  }
}
