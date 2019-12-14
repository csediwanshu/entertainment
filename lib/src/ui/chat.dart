import 'package:entsys/src/blocs/user_bloc.dart';
import 'package:entsys/src/blocs/user_provider.dart';
import 'package:entsys/src/models/message.dart';
import 'package:entsys/src/widgets/send_button.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  Widget build(context) {
    final bloc = UserProvider.of(context);
    bloc.getMessagesFirebase();
    print('${bloc.emailAddress}');
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.orange,
          title: Text('Infy Chat'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 0.0),
              child: Container(
                child: Text(
                  '${bloc.emailAddress.split('@')[0]}',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: bloc.messages,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Message>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.all(10.0),
                        itemBuilder: (context, index) {
                          print(snapshot.data[index].senderEmail);
                          return chatMessageItem(snapshot.data[index], bloc);
                        },
                        itemCount: snapshot.data.length,
                      );
                    }
                  },
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        // onSubmitted: (value) => callback(),
                        decoration: InputDecoration(
                          hintText: "Enter a Message...",
                          border: const OutlineInputBorder(),
                        ),
                        controller: _messageController,
                      ),
                    ),
                    SendButton(
                      text: "Send",
                      callback: () {
                        var text = _messageController.text;
                        Message _message = Message(
                            senderEmail: bloc.emailAddress,
                            message: text,
                            type: 'text');

                        bloc.addmessages(_message);
                        bloc.getMessagesFirebase();
                        _messageController.clear();
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

 

  Widget chatMessageItem(Message snapshot, UserBloc bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: snapshot.senderEmail == bloc.emailAddress
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: <Widget>[
              snapshot.senderEmail == bloc.emailAddress
                  ? senderLayout(snapshot)
                  : receiverLayout(snapshot)
            ],
          ),
        )
      ],
    );
  }

  Widget senderLayout(Message snapshot) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent[100],
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(snapshot.message,
              style: TextStyle(color: Colors.black, fontSize: 16.0))),
    );
  }

  Widget receiverLayout(Message snapshot) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.grey)),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                snapshot.senderEmail.split('@')[0],
                style: TextStyle(color: Colors.purple, fontSize: 16.0),
                textAlign: TextAlign.right,
              ),
              Text(snapshot.message,
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
            ],
          )),
    );
  }
}
