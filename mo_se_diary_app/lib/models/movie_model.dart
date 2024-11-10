import 'package:mo_se_diary_app/domain/entities/movie_entity.dart';

class MovieModel implements MovieEntity {
  @override
  final String backdropPath; // ? kaldırıldı
  @override
  final int id; // ? kaldırıldı
  @override
  final String title; // ? kaldırıldı
  final String originalTitle; // ? kaldırıldı
  @override
  final String overview; // ? kaldırıldı
  @override
  final String posterPath; // ? kaldırıldı
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  @override
  final String releaseDate; // ? kaldırıldı
  final bool? video;
  @override
  final num voteAverage;
  final int? voteCount;

  MovieModel(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      this.mediaType,
      this.adult,
      this.originalLanguage,
      this.genreIds,
      this.popularity,
      required this.releaseDate,
      this.video,
      required this.voteAverage,
      this.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'] ?? '', // Varsayılan değer eklendi
      id: json['id'],
      title: json['title'] ?? '', // Varsayılan değer eklendi
      originalTitle: json['original_title'] ?? '', // Varsayılan değer eklendi
      overview: json['overview'] ?? '', // Varsayılan değer eklendi
      posterPath: json['poster_path'] ?? '', // Varsayılan değer eklendi
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids']?.cast<int>(),
      popularity: json['popularity']?.toDouble(),
      releaseDate: json['release_date'] ?? '', // Varsayılan değer eklendi
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['adult'] = this.adult;
    data['original_language'] = this.originalLanguage;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
