import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
final _firestore = Firestore.instance;
bool test = false;
class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String message;
  void updatemessage() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var messagedata in snapshot.documents) {
        print(messagedata.data);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final MessageTextController= TextEditingController();
    return Container( child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        messageStream(),
        Container(
          decoration: kMessageContainerDecoration,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: MessageTextController,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: kMessageTextFieldDecoration,
                ),
              ),
              FlatButton(
                onPressed: () {
                  test = true;
                    MessageTextController.clear();
                  _firestore.collection('messages').add({
                    'text': message,
                    'date': DateTime.now().toIso8601String().toString(),
                    'isme': true

                  });
                },
                child: Text(
                  'Send',
                  style: kSendButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    ),);
  }
}
class messageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('date').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
           return CircularProgressIndicator();
          }
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageWidget = [];
          for (var message in messages) {
            final messagetext = message.data['text'];
            final testo = message.data['isme'];
            final messagewid = MessageBubble(text: messagetext, isMe: testo,);
            messageWidget.add(messagewid);
          }
          return Container(child: ListView(reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidget));
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.text,this.isMe});
  String text;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: <Widget>[
          Material(
              elevation: 5.0,
              color: isMe?Colors.lightBlueAccent:Colors.white,
              child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(text, style: TextStyle(
                      color: isMe?Colors.white:Colors.black, fontSize: 16
                  ),)),
              borderRadius: isMe?BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)):
              BorderRadius.only(topRight: Radius.circular(30), bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
          ),
        ],
      ),
    );
  }
}

