part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitialState extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsSuccessLoadState extends NewsState {
  final List<SongEntity> songs;

  NewsSuccessLoadState({
    required this.songs,
  });
}

final class NewsErrorState extends NewsState {
  final String message;

  NewsErrorState({
    required this.message,
  });
}
