import 'package:entsys/src/ui/chat.dart';
import 'package:entsys/src/ui/song.dart';
import 'package:entsys/src/ui/video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget{
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Infy Entertainment'),
      ),
      body: ListView(
  children:  <Widget>[
    Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return Video();
          }));
        },
        leading: FlutterLogo(),
        title: Text('Movies'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return Song();
          }));
        },
        leading: FlutterLogo(),
        title: Text('Songs'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return Chat();
          }));
        },
        leading: FlutterLogo(),
        title: Text('Group Chat'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
  ],
),
    );
  }
}