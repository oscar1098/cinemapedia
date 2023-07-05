

import 'package:cinemapedia/infraestructure/datasource/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este repositorio es inmutable
final movieRepositoryProvidder = Provider((ref) {
  
  return MoviesRepositiryImpl( MoviedbDatasource() );
});






