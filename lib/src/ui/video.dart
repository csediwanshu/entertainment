import 'dart:convert';

import 'package:entsys/src/blocs/pnr_bloc_provider.dart';
import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/resources/provider.dart';
import 'package:entsys/src/resources/repository.dart';
import 'package:entsys/src/widgets/article_description.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
    
  Widget build(context) {
    final bloc = PnrBlockProvider.of(context);
    bloc.getMovies();
    
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Infy Entertainment')),
        ),
        //  body: ListView.builder(
        //    padding: EdgeInsets.all(10.0),
        //    itemCount: ans.length,
        //    itemBuilder: (context,index){
        //      print('${ans.length}=============${ans[0].title}=========$index');
        // //      return CustomListItemTwo(
        //             thumbnail: Container(
        //               decoration: const BoxDecoration(color: Colors.pink),
        //               ),
        //               title: ans[index].title,
        //               subtitle: ans[index].plot,
        //               author: ans[index].director,
        //               publishDate: ans[index].released,
        //               readDuration: ans[index].rated,
        //             );
        //    },
        //  ) 
        body : StreamBuilder(
           stream: bloc.movies,
           builder: (context,AsyncSnapshot<List<MoviesDetail>> snapshot){
            //  print('vdhvdvs =========================${snapshot.data.length}=========== ');
             if(!snapshot.hasData){
               return Center(
                 child: CircularProgressIndicator(),
                 );
             }
             return ListView.builder(
               padding: const EdgeInsets.all(10.0),
               itemCount: snapshot.data.length,
               itemBuilder: (context,index){
                 print('==============================$index=========${snapshot.data[index].title}');
                  return CustomListItemTwo(
                    thumbnail: Container(
                      decoration: const BoxDecoration(color: Colors.pink),
                      ),
                      title: snapshot.data[index].title,
                      subtitle: snapshot.data[index].plot,
                      author: snapshot.data[index].director,
                      publishDate: snapshot.data[index].released,
                      readDuration: snapshot.data[index].rated,
                    );
               },
             );
           },
         ),


  //        ListView(
  //   padding: const EdgeInsets.all(10.0),
  //   children:
    
    
  //   <Widget>[
  //     CustomListItemTwo(
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.pink),
  //       ),
  //       title: 'Flutter 1.0 Launch',
  //       subtitle:
  //         'Flutter continues to improve and expand its horizons.'
  //         'This text should max out at two lines and clip',
  //       author: 'Dash',
  //       publishDate: 'Dec 28',
  //       readDuration: '5 mins',
  //     ),
  //     CustomListItemTwo(
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.blue),
  //       ),
  //       title: 'Flutter 1.2 Release - Continual updates to the framework',
  //       subtitle: 'Flutter once again improves and makes updates.',
  //       author: 'Flutter',
  //       publishDate: 'Feb 26',
  //       readDuration: '12 mins',
  //     ),
  //   ],
  // ),
  //ListView(
  //   padding: const EdgeInsets.all(8.0),
  //   itemExtent: 106.0,
  //   children: <CustomListItem>[
  //     CustomListItem(
  //       user: 'Flutter',
  //       viewCount: 999000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.blue),
  //       ),
  //       title: 'The Flutter YouTube Channel',
  //     ),
  //     CustomListItem(
  //       user: 'Dash',
  //       viewCount: 884000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.yellow),
  //       ),
  //       title: 'Announcing Flutter 1.0',
  //     ),
  //     CustomListItem(
  //       user: 'Dash',
  //       viewCount: 884000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.yellow),
  //       ),
  //       title: 'Announcing Flutter 1.0',
  //     ),
  //     CustomListItem(
  //       user: 'Dash',
  //       viewCount: 884000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.yellow),
  //       ),
  //       title: 'Announcing Flutter 1.0',
  //     ),
  //     CustomListItem(
  //       user: 'Dash',
  //       viewCount: 884000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.yellow),
  //       ),
  //       title: 'Announcing Flutter 1.0',
  //     ),
  //     CustomListItem(
  //       user: 'Dash',
  //       viewCount: 884000,
  //       thumbnail: Container(
  //         decoration: const BoxDecoration(color: Colors.yellow),
  //       ),
  //       title: 'Announcing Flutter 1.0',
  //     ),
  //   ],
  // ),
        //ListView.builder(
        //   itemCount: ans.length,
        //   itemBuilder: (context,index) => ListTile(
        //     leading: const Icon(Icons.flight_land),
        //       title: Text('${ans[index].title}'),
        //       subtitle: Text('${ans[index].rated}'),
        //       onTap: (){
        //         VideoExample();
        //       },
        //     ),
        // ) 
        );
  }
}
