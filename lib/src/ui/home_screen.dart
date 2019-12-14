import 'package:entsys/src/blocs/user_bloc.dart';
import 'package:entsys/src/blocs/user_provider.dart';
import 'package:entsys/src/resources/string.dart';
import 'package:entsys/src/ui/options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  Widget build(context){
     final bloc = UserProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Entertainmet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Image.asset('assets/logo.png'),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          pnrField(bloc),
          SizedBox(height: 10.0,),
          button(context,bloc),
        ],
      ),
    );
  }


  Widget pnrField(UserBloc bloc) {
    return StreamBuilder(
        stream: bloc.pnr,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.showPnr,
            obscureText: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: StringConstant.pnrHint,
                errorText: snapshot.error),
          );
        });
  }
  Widget button(BuildContext context,UserBloc bloc) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.orangeAccent,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          hoverColor: Colors.purple,
          textColor: Colors.white,
          onPressed: () {
            bloc.verifyPnr().then((value){
              if(value){
                 Navigator.push(context,
                MaterialPageRoute(builder: (context) {
               return Options();
            }));
              }
              else {
                print(value);
               Center(
                  child: SnackBar(
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 2))
  
                );
                
              }
            });
          },
          minWidth: 250.0,
          height: 50.0,
          child: Text(StringConstant.submit),
        ),
      ),
    );
  }
  
}