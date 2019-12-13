import 'package:entsys/src/blocs/pnr_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PnrBlockProvider extends InheritedWidget{
  final PnrBloc bloc;
  PnrBlockProvider({Key key,Widget child})
      : bloc = PnrBloc(),
        super(key:key,child:child);
  
  bool updateShouldNotify(_) => true;

  static PnrBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(PnrBlockProvider) as PnrBlockProvider).bloc;
  }
}

