class Movie {
  final int id;
  final String title;
  final String overview; // Eklendi
  final String posterPath;
  final String backDropPath;
  final String releaseDate; // Eklendi
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview, // Eklendi
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate, // Eklendi
    required this.voteAverage,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      overview: map['overview'] ?? '', // Eklendi
      posterPath: map['poster_path'] ?? '',
      backDropPath: map['backdrop_path'] ?? '',
      releaseDate: map['release_date'] ?? '', // Eklendi
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
    );
  }
}
