import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/controller/album_list/album_list_bloc.dart';
import 'package:flutter_challenge/model/album_model.dart';
import 'package:flutter_challenge/view/album_list.dart';
import 'package:flutter_challenge/view/album_photos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class MockAlbumListBloc extends MockBloc<AlbumListEvent, AlbumListState>
    implements AlbumListBloc {}

void main() {
  group('AlbumListView', () {
    late MockAlbumListBloc albumListBloc;

    setUp(() {
      albumListBloc = MockAlbumListBloc();
    });

    testWidgets('renders CircularProgressIndicator when loading',
            (WidgetTester tester) async {
          // Arrange
          when(albumListBloc.state).thenReturn(AlbumListLoading());
          await tester.pumpWidget(
            BlocProvider.value(
              value: albumListBloc,
              child: const MaterialApp(
                home: AlbumListView(),
              ),
            ),
          );

          // Assert
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

    testWidgets('renders error message when there is an error',
            (WidgetTester tester) async {
          // Arrange
          when(albumListBloc.state).thenReturn(AlbumListError("error"));
          await tester.pumpWidget(
            BlocProvider.value(
              value: albumListBloc,
              child: const MaterialApp(
                home: AlbumListView(),
              ),
            ),
          );

          // Assert
          expect(find.text('Error'), findsOneWidget);
        });

    testWidgets('renders album list when loaded',
            (WidgetTester tester) async {
          // Arrange
          final albumList = [
            AlbumList(
              id: 1,
              userId: 1,
              title: 'Album 1',
            ),
            AlbumList(
              id: 2,
              userId: 1,
              title: 'Album 2',
            ),
          ];
          whenListen(
            albumListBloc,
            Stream.fromIterable([AlbumListLoaded(albumList)]),
          );
          await tester.pumpWidget(
            BlocProvider.value(
              value: albumListBloc,
              child: MaterialApp(
                home: AlbumListView(),
              ),
            ),
          );

          // Assert
          expect(find.byType(TextField), findsOneWidget);
          expect(find.byType(ListView), findsOneWidget);
          expect(find.text('Album 1'), findsOneWidget);
          expect(find.text('Album 2'), findsOneWidget);
        });

    testWidgets('navigates to AlbumPhotosView when album is tapped',
            (WidgetTester tester) async {
          // Arrange
          final albumList = [
            AlbumList(
              id: 1,
              userId: 1,
              title: 'Album 1',
            ),
            AlbumList(
              id: 2,
              userId: 1,
              title: 'Album 2',
            ),
          ];
          whenListen(
            albumListBloc,
            Stream.fromIterable([AlbumListLoaded( albumList)]),
          );
          await tester.pumpWidget(
            BlocProvider.value(
              value: albumListBloc,
              child: MaterialApp(
                home: AlbumListView(),
              ),
            ),
          );

          // Act
          await tester.tap(find.text('Album 1'));
          await tester.pumpAndSettle();

          // Assert
          expect(find.byType(AlbumPhotosView), findsOneWidget);
        });
  });
}
