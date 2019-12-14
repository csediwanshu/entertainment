import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entsys/src/models/message.dart';
import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/models/songs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class Provider {
  Client client = Client();
  List<MoviesDetail> ans = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  

  Future<bool> registerUser(String email1, String password1) async {
    print('In registerUSer $email1 ============ $password1');
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: email1,
      password: password1,
    );
    print('In registerUSer register user Suceesful ${user.email}');

    if (user != null) {
      return true;
    }
    return false;
  }

  Future<FirebaseUser> loginUser(String email, String password) async {
   

    final FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    print("Inside authenticateUser============ ${user.email}");
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: user.email)
        .getDocuments();

    final List<DocumentSnapshot> docs = result.documents;
    print('In authenticateUser =============== ${docs.length}');
    if (docs.length == 0) {
      return true;
    } else {
      return false;
    }
    }
      Future<List<Message>> getMessagesFirebase() async{
      List<Message> ans =[];
      // print('in getMessagesFirebase===============================');
      final QuerySnapshot results= await _firestore.collection("messages").getDocuments();
      final List<DocumentSnapshot> docs = results.documents;
      for(int i=0;i<docs.length;i++){
        Message message = Message(
        senderEmail: docs[i].data['senderEmail'],
        type: docs[i].data['type'],
        message: docs[i].data['message'],
        );
      ans.add(message);
      }
      print('end ===================================${ans.length}');
      return ans;
  }

  Future<void> addMessages(Message message) async{
    print("Message : ${message.message}");
    var map = message.toMap();

    print("Map : $map");
    await _firestore.collection("messages").add(map);
  }
  

  // List<MoviesDetail> getMovies() {
  //   print(';dbkbdkbkdbjdnnd==============================');
  //   print(response['title']);
  //   ans.add(MoviesDetail.fromJson(response));
  //   print(ans[0].title);
  //   ans.add(MoviesDetail.fromJson(response2));
  //   ans.add(MoviesDetail.fromJson(response1));
  //   return ans;
  // }

  Future<List<MoviesDetail>> getMoviesApi() async {
    List<MoviesDetail> ans = [];
    print('cbggdjyvdhjbdbdkbkjdbkd====================');
    final response =
        await client.get('http://www.omdbapi.com/?i=tt3896198&apikey=e1f89c51');
    print('abgsgshsksvkvsjhvshjbvjhsb-=======================');
    final response1 =
        await client.get('http://www.omdbapi.com/?t=joker&apikey=e1f89c51');
    final response2 =
        await client.get('http://www.omdbapi.com/?t=inception&apikey=e1f89c51');
    final ids = json.decode(response.body);
    final ids1 = json.decode(response1.body);
    final ids2 = json.decode(response2.body);
    ans.add(MoviesDetail.fromJson(ids));
    ans.add(MoviesDetail.fromJson(ids2));
    ans.add(MoviesDetail.fromJson(ids1));
    //  _firestore.collection('user').getDocuments();
    print('========================================');
    print(ans.length);
    return ans;
  }

  // Future<FirebaseUser> fillUserDetails(
  //     String email, String phoneNo, String name) async {
  //   FirebaseUser currentUser1;
  //   currentUser1 = await _auth.currentUser();

  //   UserUpdateInfo updateInfo = UserUpdateInfo();
  //   updateInfo.displayName = name;
  //   await currentUser1.updateProfile(updateInfo);

  //   _firestore.collection("display_names").document(name).setData({
  //     'displayName': name,
  //   });
  //   // final user = User(
  //   //   uid: currentUser1.uid,
  //   //   email: email,
  //   //   displayName: name,
  //   //   photoUrl: '',
  //   //   followers: '0',
  //   //   following: '0',
  //   //   bio: '',
  //   //   posts: '0',
  //   //   phone: phoneNo,
  //   // );
  //   await _firestore
  //       .collection("users")
  //       .document(currentUser1.uid)
  //       .setData(user.toMap(user));
  //   currentUser1 = await _auth.currentUser();
  //   print('${currentUser1.displayName}');

  //   return currentUser1;
  // }

  Future<List<MoviesDetail>> getMoviesFirebase() async {
    List<MoviesDetail> movies = [];
    final QuerySnapshot results =
        await _firestore.collection("movies").getDocuments();
    print('hawah===================================hawhasvhvbdj');
    final List<DocumentSnapshot> docs = results.documents;
    for (int i = 0; i < docs.length; i++) {
      MoviesDetail movie = MoviesDetail(
        title: docs[i].data['title'],
        year: docs[i].data['year'],
        rated: docs[i].data['rating'],
        released: docs[i].data['released'],
        runtime: docs[i].data['runtime'],
        genre: docs[i].data['genre'],
        director: docs[i].data['director'],
        writer: docs[i].data['writer'],
        actors: docs[i].data['actors'],
        plot: docs[i].data['plot'],
        language: docs[i].data['language'],
        country: docs[i].data['country'],
        awards: docs[i].data['awards'],
        poster: docs[i].data['poster'],
        url : docs[i].data['url'],
      );
      movies.add(movie);
    }
    return movies;
  }

  Future<List<SongsDetail>> getSongsFirebase() async {
    List<SongsDetail> songs = [];
    final QuerySnapshot results =
        await _firestore.collection("songs").getDocuments();
    print('hawah===================================hawhasvhvbdj');
    final List<DocumentSnapshot> docs = results.documents;
    for (int i = 0; i < docs.length; i++) {
      SongsDetail song = SongsDetail(
        genre: docs[i].data['genre'],
        name: docs[i].data['name'],
        rating: docs[i].data['rating'],
        releasedate: docs[i].data['releasedate'],
        singer: docs[i].data['singer'],
        url: docs[i].data['url'],
        writer: docs[i].data['writer'],
      );
      songs.add(song);
    }
    return songs;
  }

  Future<bool> verifyPnr(String pnr) async {
    print(pnr);
    final QuerySnapshot result = await _firestore
        .collection("user")
        .where("pnrno", isEqualTo: pnr)
        .getDocuments();
    if (result.documents.length > 0) {
      final List<DocumentSnapshot> docs = result.documents;
      print('hawa1jkjbkjsbjk==============================hawa1');
      print(docs.length);
      print(docs[0].data['pnrno']);
      for (int i = 0; i < docs.length; i++) {
        if (docs[i].data['pnrno'].toString() == pnr) {
          print(docs[i].data['pnrno']);
          return true;
        }
      }
    }
    return false;
  }
}

final Provider provider = Provider();









// // User user;
//   // final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final response = {
//     "title": "Dark",
//     "year": "2017–",
//     "rated": "TV-MA",
//     "released": "01 Dec 2017",
//     "runtime": "60 min",
//     "genre": "Crime",
//     "director": "N/A",
//     "writer": "Baran bo Odar,",
//     "actors": "Karoline Eichhorn",
//     "plot": "A family saga with a supernatural",
//     "language": "German",
//     "country": "Germany",
//     "awards": "1 win & 5 nominations.",
//     "poster":
//         "https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"
//   };
//   // "Ratings":[{"Source":"Internet Movie Database","Value":"8.7/10"}],"Metascore":"N/A","imdbRating":"8.7","imdbVotes":"148,444","imdbID":"tt5753856","Type":"series","totalSeasons":"3","Response":"True"}

//   final response1 = {
//     "title": "Dark1",
//     "year": "2017–",
//     "rated": "TV-MA",
//     "released": "01 Dec 2017",
//     "runtime": "60 min",
//     "genre": "Crime",
//     "director": "N/A",
//     "writer": "Baran bo Odar,",
//     "actors": "Karoline Eichhorn",
//     "plot": "A family saga with a supernatural",
//     "language": "German",
//     "country": "Germany",
//     "awards": "1 win & 5 nominations.",
//     "poster":
//         "https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"
//   };
//   final response2 = {
//     "title": "Dark2",
//     "year": "2017–",
//     "rated": "TV-MA",
//     "released": "01 Dec 2017",
//     "runtime": "60 min",
//     "genre": "Crime",
//     "director": "N/A",
//     "writer": "Baran bo Odar,",
//     "actors": "Karoline Eichhorn",
//     "plot": "A family saga with a supernatural",
//     "language": "German",
//     "country": "Germany",
//     "awards": "1 win & 5 nominations.",
//     "poster":
//         "https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"
//   };
//   // Provider(){

//   // //  ans.add(MoviesDetail.fromJson(response1));
//   // }