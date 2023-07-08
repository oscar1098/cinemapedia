

import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider = StateNotifierProvider <MoviesNotifier,List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvidder ).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final popularMoviesProvider = StateNotifierProvider <MoviesNotifier,List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvidder ).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final upComingMoviesProvider = StateNotifierProvider <MoviesNotifier,List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvidder ).getUpcoming;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final topRatedMoviesProvider = StateNotifierProvider <MoviesNotifier,List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvidder ).getTopRated;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


typedef MovieCallback = Future<List<Movie>> Function( {int page} );


class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 0;

  bool isLoading = false;

  MovieCallback fetchMoreMovies;
  
  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]);

  Future <void> loadNextPage() async {
    if ( isLoading ) return;

    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies( page: currentPage );
    state = [...state, ...movies];
    await Future.delayed( const Duration( milliseconds: 300 ) );
    isLoading = false;
  }
}






















