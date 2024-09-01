import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';

abstract class SongRepository {
  Future<Either<Failure, List<SongEntity>>> getSongs();
}