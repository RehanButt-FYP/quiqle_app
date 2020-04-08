import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens//global.dart';

import 'mycircleavatar.dart';

class ReceivedMessagesWidget extends StatelessWidget {
  final int i;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          MyCircleAvatar(
            imgUrl: messages[i]['contactImgUrl'],
          ),
          SizedBox(
            width: width / 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .55),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${messages[i]['message']}",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black87,
                      ),
                ),
              ),
              Text(
                "${messages[i]['contactName']}",
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "${messages[i]['time']}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
