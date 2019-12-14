import 'package:entsys/src/app.dart';
import 'package:entsys/src/blocs/pnr_bloc_provider.dart';
import 'package:entsys/src/blocs/user_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: PnrBlockProvider(
        child: MaterialApp(
          // title: 'Flutter Demo',
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          // ),
          home: App(),
        ),
      ),
    );
  }
}
