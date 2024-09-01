import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.title,
    required super.artist,
    required super.releaseDate,
    required super.duration,
    required super.cover,
    required super.songUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'artist': artist,
      'releaseDate': releaseDate,
      'duration': duration,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['title'],
      artist: map['artist'],
      releaseDate: map['releaseDate'],
      duration: map['duration'],
      cover: map['cover'],
      songUrl: map['song_url'],
    );
  }
}
