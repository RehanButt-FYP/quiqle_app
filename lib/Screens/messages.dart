import 'package:flutter/material.dart';

import 'global.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff45D4FF),
            title:  Text(
              "Messages",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 30,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5
              ),
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // do something
              },
            ),
          ),
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: MessagesList.length,
            itemBuilder: (ctx, i) {
              return Column(
                children: <Widget>[
                  ListTile(
                    isThreeLine: false,
                    onLongPress: () {},
                    onTap: () => Navigator.of(context).pushNamed('chat'),

                    title: Row(
                      children: <Widget>[
                        Text(
                          "${MessagesList[i]['username']}",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(width: width/35,),
                        MessagesList[i]['isOnline']
                            ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(

                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        )
                            : Container(),
                      ],
                    ),

                    subtitle: Text(
                      "${MessagesList[i]['lastMsg']}",
                      style: !MessagesList[i]['seen']
                          ? Theme.of(context)
                          .textTheme
                          .subtitle
                          .apply(color: Colors.black87)

                          : Theme.of(context)
                          .textTheme
                          .subtitle
                          .apply(color: Colors.black54),
                    ),

                    trailing: Container(
                      //color: Colors.grey,
                      width: width/5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("${MessagesList[i]['lastMsgTime']}")
                            ],
                          ),
                          SizedBox(
                            height: 0.0,
                          ),
                          MessagesList[i]['hasUnSeenMsgs']
                              ? Container(
                            alignment: Alignment.center,
                            height: height/22,
                            width: width/22,
                            decoration: BoxDecoration(
                              color: Color(0xff45D4FF),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${MessagesList[i]['unseenCount']}",
                              style: TextStyle(color: Colors.white,fontSize: height/60),
                            ),
                          )
                              : Container(
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider()
                ],
              );
            },
          ),
        ),
      );
  }
}
