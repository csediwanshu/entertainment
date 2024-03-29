import 'package:entsys/src/blocs/pnr_bloc_provider.dart';
import 'package:entsys/src/models/movies.dart';
import 'package:entsys/src/ui/video_player.dart';
import 'package:entsys/src/widgets/article_description.dart';
import 'package:flutter/material.dart';


class Video extends StatelessWidget {
  Widget build(context) {
    final bloc = PnrBlockProvider.of(context);
    bloc.getMoviesFirebase();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Login'),
      ),
      body: StreamBuilder(
        stream: bloc.movies,
        builder: (context, AsyncSnapshot<List<MoviesDetail>> snapshot) {
          //  print('vdhvdvs =========================${snapshot.data.length}=========== ');
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              print('==============================$index=========${snapshot.data[index].title}');
              return CustomListItemTwo(
                thumbnail: Container(
                  decoration: const BoxDecoration(color: Colors.pink),
                  child: GestureDetector(
                    onTap: (){
                      print('sbhjdvbjbdhd');
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return VideoExample(url:snapshot.data[index].url);
                        }));
                    },
                  ),
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
    );
  }
}
