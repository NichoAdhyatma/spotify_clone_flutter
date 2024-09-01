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
  Future<Either<Failure, List<SongEntity>>> getSongs() async {
    try {

      final songs = await remoteDataSource.getSongs();

      return right(songs);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
