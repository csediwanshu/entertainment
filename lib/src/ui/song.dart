import 'package:entsys/src/blocs/pnr_bloc_provider.dart';
import 'package:entsys/src/models/songs.dart';
import 'package:entsys/src/ui/song_player.dart';
import 'package:entsys/src/widgets/article_description.dart';
import 'package:flutter/material.dart';

class Song extends StatelessWidget {
  Widget build(context) {
    final bloc = PnrBlockProvider.of(context);
    bloc.getSongsFirebase();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Login'),
      ),
      body: StreamBuilder(
        stream: bloc.songs,
        builder: (context, AsyncSnapshot<List<SongsDetail>> snapshot) {
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
              print('==============================$index=========${snapshot.data[index].name}');
              return CustomListItemTwo(
                thumbnail: Container(
                  decoration: const BoxDecoration(color: Colors.pink),
                  child: GestureDetector(
                    onTap: (){
                      print('sbhjdvbjbdhd');
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return SongExample(url: snapshot.data[index].url);
                        }));
                    },
                  ),
                ),
                title: snapshot.data[index].name,
                subtitle: snapshot.data[index].genre,
                author: snapshot.data[index].writer,
                publishDate: snapshot.data[index].releasedate,
                readDuration: snapshot.data[index].rating,
              );
            },
          );
        },
      ),
    );
  }
}
