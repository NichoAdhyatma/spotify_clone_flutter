import 'package:fpdart/fpdart.dart';
import 'package:spotify_clone/core/error/failure.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/home/domain/repository/song_repository.dart';

class GetSongUseCase implements UseCase<List<SongEntity>, NoParams> {
  final SongRepository _songRepository;

  GetSongUseCase({
    required SongRepository songRepository,
  }) : _songRepository = songRepository;

  @override
  Future<Either<Failure, List<SongEntity>>> call(NoParams params) {
    return _songRepository.getSongs();
  }
}
