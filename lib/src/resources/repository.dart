import 'package:entsys/src/models/message.dart';
import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/models/songs.dart';
import 'package:entsys/src/resources/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  // List<MoviesDetail> getMovies() => provider.getMovies();
  Future<List<MoviesDetail>> getMoviesApi() => provider.getMoviesApi();

  Future<List<MoviesDetail>> getMoviesFirebase() =>
      provider.getMoviesFirebase();

  Future<bool> registerUser(String email, String password) =>
      provider.registerUser(email, password);

  Future<FirebaseUser> loginUser(String email, String password) =>
      provider.loginUser(email, password);

  Future<bool> authenticateUser(FirebaseUser user) =>
      provider.authenticateUser(user);

  // Future<FirebaseUser> fillUserDetails(
  //         String email, String phoneNo, String name) =>
  //     provider.fillUserDetails(email, phoneNo, name);

  Future<bool> verifyPnr(String pnr) => provider.verifyPnr(pnr);
  Future<List<SongsDetail>> getSongsFirebase() => provider.getSongsFirebase();
  Future<List<Message>> getMessagesFirebase() => provider.getMessagesFirebase();
   Future<void> addMessages(Message message) => provider.addMessages(message);
}

final Repository repository = Repository();
