import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/models/movies.dart' as prefix0;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class Provider{
  Client client = Client();
List<MoviesDetail> ans =[];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  // User user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  final  response={
    "title":"Dark",
    "year":"2017–",
    "rated":"TV-MA",
    "released":"01 Dec 2017",
    "runtime":"60 min",
    "genre":"Crime",
    "director":"N/A",
    "writer":"Baran bo Odar,",
    "actors":"Karoline Eichhorn",
    "plot":"A family saga with a supernatural",
    "language":"German",
    "country":"Germany",
    "awards":"1 win & 5 nominations.",
    "poster":"https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"};
    // "Ratings":[{"Source":"Internet Movie Database","Value":"8.7/10"}],"Metascore":"N/A","imdbRating":"8.7","imdbVotes":"148,444","imdbID":"tt5753856","Type":"series","totalSeasons":"3","Response":"True"}
 
   final  response1={
    "title":"Dark1",
    "year":"2017–",
    "rated":"TV-MA",
    "released":"01 Dec 2017",
    "runtime":"60 min",
    "genre":"Crime",
    "director":"N/A",
    "writer":"Baran bo Odar,",
    "actors":"Karoline Eichhorn",
    "plot":"A family saga with a supernatural",
    "language":"German",
    "country":"Germany",
    "awards":"1 win & 5 nominations.",
    "poster":"https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"};
  final  response2={
    "title":"Dark2",
    "year":"2017–",
    "rated":"TV-MA",
    "released":"01 Dec 2017",
    "runtime":"60 min",
    "genre":"Crime",
    "director":"N/A",
    "writer":"Baran bo Odar,",
    "actors":"Karoline Eichhorn",
    "plot":"A family saga with a supernatural",
    "language":"German",
    "country":"Germany",
    "awards":"1 win & 5 nominations.",
    "poster":"https://m.media-amazon.com/images/M/MV5BMmIyZjA3NGUtYjlhNS00ZDlkLWI0MDgtMDc2YWNjNGMwYWZhXkEyXkFqcGdeQXVyMzY0MTE3NzU@._V1_SX300.jpg"};
  // Provider(){
   
  // //  ans.add(MoviesDetail.fromJson(response1));
  // }

  
      List<MoviesDetail> getMovies(){




        print(';dbkbdkbkdbjdnnd==============================');
        print(response['title']);
        ans.add(MoviesDetail.fromJson(response));
        print(ans[0].title);
   ans.add(MoviesDetail.fromJson(response2));
   ans.add(MoviesDetail.fromJson(response1));
    return ans;
  }

  Future<List<MoviesDetail>> getMoviesApi() async {
      List<MoviesDetail> ans =[];
      print('cbggdjyvdhjbdbdkbkjdbkd====================');
    final response = await client.get('http://www.omdbapi.com/?i=tt3896198&apikey=e1f89c51');
    print('abgsgshsksvkvsjhvshjbvjhsb-=======================');
    final response1 =await client.get('http://www.omdbapi.com/?t=joker&apikey=e1f89c51');
    final response2 =await client.get('http://www.omdbapi.com/?t=inception&apikey=e1f89c51');
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

  Future<List<MoviesDetail>> getMoviesFirebase() async{
     final QuerySnapshot results = await _firestore.collection('movies').getDocuments();
     print('hawah===================================hawhasvhvbdj');
     print(results.documents.length);
  }


}
final Provider provider = Provider();

