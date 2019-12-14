import 'package:entsys/src/blocs/user_bloc.dart';
import 'package:entsys/src/blocs/user_provider.dart';
import 'package:entsys/src/resources/string.dart';
import 'package:entsys/src/ui/login.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterUser> {

  Widget build(context) {
    final bloc = UserProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Register'),
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
              bloc.registerUser().then((value){
                if(value){
                  Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
               return Login();
            }));
                }
              });
            } else {
              showErrorMessage();
            }
          },
          minWidth: 250.0,
          height: 50.0,
          child: Text(StringConstant.submit),
        ),
      ),
    );
  }

  // void authenticateUser(UserBloc bloc) {
  //   bloc.showProgressBar(true);
  //   bloc.registerUser().then((user) {
  //     if (user != null) {
  //       bloc.authenticateUser(user).then((value) {
  //         if (!value) {
  //           print('User Details added already');
  //           Navigator.pushReplacement(context,
  //               MaterialPageRoute(builder: (context) {
  //             // return InstaHomeScreen(user: user);
  //           }));
  //         } else {
  //           print('user need to be added');
  //           Navigator.pushReplacement(context,
  //               MaterialPageRoute(builder: (context) {
  //             // return AddDescNewUser(user: user);
  //           }));
  //         }
  //       });
  //     }
  //   });
  // }

  void showErrorMessage() {
    final snackbar = SnackBar(
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
