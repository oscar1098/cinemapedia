

import 'package:cinemapedia/domain/datasources/moivies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositiryImpl extends MoviesRepository {

  final MoviesDataSource datasource;
  MoviesRepositiryImpl(this.datasource);


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {

  return datasource.getNowPlaying( page: page );    
  }

}