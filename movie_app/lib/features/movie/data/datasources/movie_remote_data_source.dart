import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/features/movie/data/models/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<MovieModel>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}/movie/popular?api_key=${ApiConstants.apiKey}'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return (body['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
