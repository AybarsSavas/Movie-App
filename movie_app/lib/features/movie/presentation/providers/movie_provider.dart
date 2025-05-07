import 'package:flutter/material.dart';
import 'package:movie_app/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepositoryImpl _repository =
      MovieRepositoryImpl(MovieRemoteDataSource());

  List<Movie> _movies = [];
  final List<Movie> _favorites = [];

  List<Movie> get movies => _movies;
  List<Movie> get favorites => _favorites;

  Future<void> loadMovies() async {
    _movies = await _repository.getPopularMovies();
    notifyListeners();
  }

  void toggleFavorite(Movie movie) {
    if (_favorites.contains(movie)) {
      _favorites.remove(movie);
    } else {
      _favorites.add(movie);
    }
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favorites.contains(movie);
  }
}
