import 'package:flutter/material.dart';
import 'package:mo_se_diary_app/Model/model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        // Uzun içerikler için kaydırma özelliği
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Film posteri
              Image.network(
                "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              // Film adı
              Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Yayın tarihi
              Text("Yayın Tarihi: ${movie.releaseDate}"),
              const SizedBox(height: 8),
              // Puanı
              Text("Puan: ${movie.voteAverage}"),
              const SizedBox(height: 16),
              // Özeti
              const Text(
                "Özet:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(movie.overview),
            ],
          ),
        ),
      ),
    );
  }
}
