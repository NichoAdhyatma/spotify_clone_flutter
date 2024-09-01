import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/core/error/exception.dart';
import 'package:spotify_clone/features/home/data/models/song_model.dart';

abstract class SongRemoteDatasource {
  Future<List<SongModel>> getSongs();
}

class SongRemoteDatasourceImpl implements SongRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore;

  SongRemoteDatasourceImpl({required FirebaseFirestore firestore})
      : _firebaseFirestore = firestore;

  @override
  Future<List<SongModel>> getSongs() async {
    try {
      final query = await _firebaseFirestore
          .collection('songs')
          .orderBy(
            'releaseDate',
            descending: true,
          )
          .get();

      final songs = query.docs
          .map(
            (song) => SongModel.fromMap(
              song.data(),
            ),
          )
          .toList();

      return songs;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? "Error");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
