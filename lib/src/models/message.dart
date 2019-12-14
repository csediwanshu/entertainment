// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class Message {
  String senderEmail;
  String type;
  // bool me;
  String message;

  Message({this.senderEmail, this.type, this.message});
  Message.withoutMessage({this.senderEmail, this.type});

  Map toMap() {
    var map = Map<String, dynamic>();
    map['senderEmail'] = this.senderEmail;
    map['type'] = this.type;
    map['message'] = this.message;

    return map;
  }

  Message fromMap(Map<String, dynamic> map) {
    Message _message = Message();
    _message.senderEmail = map['senderEmail'];
    _message.type = map['type'];
    _message.message = map['message'];
    return _message;
  }

  // Widget build(context){
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment:
  //           me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
  //       children: <Widget>[
  //         me? Text(senderEmail,) : Text(receiverEmail,),
  //         Material(
  //           color: me ? Colors.teal : Colors.red,
  //           borderRadius: BorderRadius.circular(10.0),
  //           elevation: 6.0,
  //           child: Container(
  //             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //             child: Text(
  //               message,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

}
