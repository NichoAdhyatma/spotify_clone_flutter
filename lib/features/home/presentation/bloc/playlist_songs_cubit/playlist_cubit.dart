import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/home/domain/usecases/get_playlist_songs_usecase.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final GetPlaylistSongsUseCase _getPlaylistSongsUseCase;

  PlaylistCubit({required GetPlaylistSongsUseCase getPlaylistSongsUseCase})
      : _getPlaylistSongsUseCase = getPlaylistSongsUseCase,
        super(PlaylistInitial());

  void loadSongs() async {
    emit(PlaylistLoadingState());
    final result = await _getPlaylistSongsUseCase(NoParams());
    result.fold(
      (failure) => emit(
        PlaylistErrorState(
          message: failure.message,
        ),
      ),
      (songs) => emit(
        PlaylistSuccessLoadState(
          songs: songs,
        ),
      ),
    );
  }
}
