import 'package:spotify_clone/features/home/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.title,
    required super.artist,
    required super.releaseDate,
    required super.duration,
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
      title: map['title'] as String,
      artist: map['artist'] as String,
      releaseDate: DateTime.fromMillisecondsSinceEpoch(map['releaseDate']),
      duration: map['duration'] as num,
    );
  }
}
