import 'package:entsys/src/blocs/user_bloc.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends InheritedWidget {
  final UserBloc bloc;
  UserProvider({Key key, Widget child})
      : bloc = UserBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
        .bloc;
  }
}
