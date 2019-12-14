import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/models/songs.dart';
import 'package:entsys/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PnrBloc{
  final _repository = Repository();
  final _moviesOutput = BehaviorSubject<List<MoviesDetail>>();
  final _songsOutput = BehaviorSubject<List<SongsDetail>>();
  

   Observable<List<MoviesDetail>> get movies => _moviesOutput.stream;
   Observable<List<SongsDetail>> get songs => _songsOutput.stream;
      
   Function(List<MoviesDetail>) get changeMovies => _moviesOutput.sink.add ;
   Function(List<SongsDetail>) get changeSongs => _songsOutput.sink.add ;

  //  Future<void> getMovies() async {
  //    final ans=  _repository.getMovies();
  //    print('================================${ans.length}');
  //    _moviesOutput.sink.add(ans);
  //  }

  //  Future<void> getMoviesApi() async{
  //    final ans = await _repository.getMoviesApi();
  //     _moviesOutput.sink.add(ans);
  //  }

   Future<void> getMoviesFirebase() async{
     print('in getMoviesFirebase=======================');
     final ans = await _repository.getMoviesFirebase();
     print('end=========================end');
     _moviesOutput.sink.add(ans);
      // _moviesOutput.sink.add(ans);
   }

   Future<void> getSongsFirebase() async{
     print('in getSongsFirebase=======================');
     final ans = await _repository.getSongsFirebase();
     print('end=========================end');
     _songsOutput.sink.add(ans);
      // _moviesOutput.sink.add(ans);
   }

   void dispose(){
     _songsOutput.close();
     _moviesOutput.close();
   }



}