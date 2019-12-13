import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/resources/provider.dart';

class Repository{
  // List<MoviesDetail> getMovies() => provider.getMovies();
  Future<List<MoviesDetail>> getMoviesApi() => provider.getMoviesApi(); 
}

final Repository repository = Repository();