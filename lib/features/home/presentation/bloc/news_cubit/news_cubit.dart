import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';
import 'package:spotify_clone/features/home/domain/usecases/get_news_songs_usecase.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsSongsUseCase _getSongsUseCase;

  NewsCubit({required GetNewsSongsUseCase getSongsUseCase})
      : _getSongsUseCase = getSongsUseCase,
        super(NewsLoadingState());

  void loadSongs() async {
    emit(NewsLoadingState());
    final result = await _getSongsUseCase(NoParams());
    result.fold(
      (failure) => emit(
        NewsErrorState(
          message: failure.message,
        ),
      ),
      (songs) => emit(
        NewsSuccessLoadState(
          songs: songs,
        ),
      ),
    );
  }
}
