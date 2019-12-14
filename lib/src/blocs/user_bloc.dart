import 'dart:async';
import 'package:entsys/src/models/message.dart';
import 'package:entsys/src/resources/repository.dart';
import 'package:entsys/src/resources/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';


class UserBloc {
  final _repository = Repository();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();
  final _pnr = BehaviorSubject<String>();
  final _messageOutput = BehaviorSubject<List<Message>>();
  // final _firebaseUser = BehaviorSubject<FirebaseUser>();

  Observable<String> get email => _email.stream.transform(_validateEmail);
  Observable<String> get password =>
      _password.stream.transform(_validatePassword);
  Observable<bool> get signInStatus => _isSignedIn.stream;
  // Observable<FirebaseUser> get firebaseUser => _firebaseUser.stream;
  Observable<String> get pnr => _pnr.stream;
  Observable<List<Message>> get messages => _messageOutput.stream;

  String get emailAddress => _email.value;

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(bool) get showProgressBar => _isSignedIn.sink.add;

  Function(String) get showPnr => _pnr.sink.add;
     Function(List<Message>) get changeMessages => _messageOutput.sink.add;


  // Function(FirebaseUser) get showFirebaseUser => _firebaseUser.sink.add;

  Future<bool> verifyPnr() async {
   return await _repository.verifyPnr(_pnr.value);
  }

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError(StringConstant.emailValidateMessage);
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError(StringConstant.passwordValidateMessage);
    }
  });

  Future<bool> registerUser() async {
    final ans =  await _repository.registerUser(_email.value, _password.value);
    if(ans) return true;
    return false;
  }

  Future<bool> authenticateUser(FirebaseUser user) async {
    return await _repository.authenticateUser(user);
  }

  Future<FirebaseUser> loginUser() async {
    print('${_email.value}=============10==============${_password.value}}');
  
    return( await _repository.loginUser(_email.value, _password.value));
   
  
  
   
  }
  //  Future<FirebaseUser> fillUserDetails(
  //         String email, String phoneNo, String name) =>
  //     _repository.fillUserDetails(email, phoneNo, name);

   Future<void> getMessagesFirebase() async{
      print('in getMessagesFirebase=======================');
     final ans = await _repository.getMessagesFirebase();
     print('end=========================end');
     _messageOutput.sink.add(ans);
   }
   
   void addmessages(Message message){
     
     _repository.addMessages(message);
   }


  void dispose() async {
    await _email.drain();
    _email.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
    _pnr.close();
    _messageOutput.close();
  }

  bool validateFields() {
    if (_email.value != null &&
        _email.value.isNotEmpty &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _email.value.contains('@') &&
        _password.value.length > 3) {
      return true;
    } else {
      return false;
    }
  }
}
