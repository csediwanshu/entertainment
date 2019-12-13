import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PnrBloc{
  final _repository = Repository();
  final _moviesOutput = BehaviorSubject<List<MoviesDetail>>();

   Observable<List<MoviesDetail>> get movies => _moviesOutput.stream;

  //  Future<void> getMovies() async {
  //    final ans=  _repository.getMovies();
  //    print('================================${ans.length}');
  //    _moviesOutput.sink.add(ans);
  //  }

   Future<void> getMoviesApi() async{
     final ans = await _repository.getMoviesApi();
      _moviesOutput.sink.add(ans);
   }



}