part of 'playlist_cubit.dart';

@immutable
sealed class PlaylistState {}

final class PlaylistInitial extends PlaylistState {}

final class PlaylistLoadingState extends PlaylistState {}

final class PlaylistErrorState extends PlaylistState {
  final String message;

  PlaylistErrorState({
    required this.message,
  });
}

final class PlaylistSuccessLoadState extends PlaylistState {
  final List<SongEntity> songs;

  PlaylistSuccessLoadState({
    required this.songs,
  });
}
