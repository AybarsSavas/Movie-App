import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/presentation/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network('${ApiConstants.imageBaseUrl}${movie.posterPath}'),
            const SizedBox(height: 16),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(
                provider.isFavorite(movie)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              label: Text(provider.isFavorite(movie)
                  ? 'Remove from Favorites'
                  : 'Add to Favorites'),
              onPressed: () {
                provider.toggleFavorite(movie);
              },
            )
          ],
        ),
      ),
    );
  }
}
