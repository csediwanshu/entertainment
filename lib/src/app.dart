import 'package:entsys/src/ui/login.dart';
import 'package:entsys/src/ui/register_user.dart';
import 'package:entsys/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget build(context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text('Infy Entertainment')
          ),
      ),
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: CustomButton(
                text: 'Log In',
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              color: Colors.transparent,
              child: CustomButton(
                text: "Register",
                callback: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegisterUser();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
