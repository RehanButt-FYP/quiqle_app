import 'package:flutter/material.dart';
import 'package:quiqle_app/Widgets/widgets.dart';

import 'global.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff45D4FF),
        title: Text(
          "Workout Squard",
          style: TextStyle(
              color: Colors.white,
              fontSize: height / 30,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.5),
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: messages.length,
                    itemBuilder: (ctx, i) {
                      if (messages[i]['status'] == MessageType.received) {
                        return ReceivedMessagesWidget(i: i);
                      } else {
                        return SentMessageWidget(i: i);
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  height: 61,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: Colors.grey)
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: width / 20),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Type Something...",
                                      border: InputBorder.none),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.send,
                                  color: Color(0xff45D4FF),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: width / 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
