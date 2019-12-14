import 'package:entsys/src/blocs/user_bloc.dart';
import 'package:entsys/src/blocs/user_provider.dart';
import 'package:entsys/src/resources/string.dart';
import 'package:entsys/src/ui/home_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar() {
    print("Show Snackbar here !");
    final snackBar = new SnackBar(
        content: new Text("This is a SnackBar"),
        duration: new Duration(seconds: 3),
        
        backgroundColor: Colors.green,
        action: new SnackBarAction(label: 'Ok', onPressed: (){
          print('press Ok on SnackBar');
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  Widget build(context) {
    final bloc = UserProvider.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Login'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Expanded(
          //   child: Hero(
          //     tag: 'logo',
          //     child: Image.asset('assets/logo.png'),
          //   ),
          // ),
          SizedBox(
            height: 40.0,
          ),
          emailField(bloc),
          SizedBox(height: 20.0),
          passwordField(bloc),
          SizedBox(height: 10.0,),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget passwordField(UserBloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: StringConstant.passwordHint,
                errorText: snapshot.error),
          );
        });
  }

  Widget emailField(UserBloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: StringConstant.emailHint,
                errorText: snapshot.error),
          );
        });
  }

  Widget submitButton(UserBloc bloc) {
    return StreamBuilder(
        stream: bloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button(bloc);
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button(UserBloc bloc) {
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
            if (bloc.validateFields()) {
              authenticateUser(bloc);
            } else {
               _showSnackBar();
            }
          },
          minWidth: 250.0,
          height: 50.0,
          child: Text(StringConstant.submit),
        ),
      ),
    );
  }

  void authenticateUser(UserBloc bloc) {
    bloc.showProgressBar(true);
    bloc.loginUser().then((user) {
      if (user != null) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return HomeScreen();
            }));
      }
      else {
        _showSnackBar();
      }
     }
    );
        }
         
    // return AlertDialog(
    //       title: new Text("User not Registered"),
    //       actions: <Widget>[
    //         new FlatButton(
    //           child: Text('Close'),
    //           onPressed: (){
    //             Navigator.of(context);
    //           },
    //         )
    //       ],
    //     );
  

  void showErrorMessage() {
    print('dbjdvjhvdjhbdvdkbdkjbkdj=======================');
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 10));
    Scaffold.of(context).showSnackBar(snackbar);
    print('sbsvbjbsbsjhsjs');
  }
}
