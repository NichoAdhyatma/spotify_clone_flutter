import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/exception.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/home/data/datasources/song_remote_datasource.dart';
import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/home/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDatasource remoteDataSource;

  SongRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<SongEntity>>> getNewsSongs() async {
    try {
      final songs = await remoteDataSource.getSongs(limit: 3);

      return right(songs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<SongEntity>>> getPlaylistSongs() async {
    try {
      final songs = await remoteDataSource.getSongs(limit: 10);

      return right(songs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
