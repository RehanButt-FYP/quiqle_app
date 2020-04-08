import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens//global.dart';

import 'mycircleavatar.dart';

class SentMessageWidget extends StatelessWidget {
  final int i;
  const SentMessageWidget({
    Key key,
    this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xff45D4FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${messages[i]['message']}",
                  style: Theme.of(context).textTheme.body2.apply(
                        color: Colors.white,
                      ),
                ),
              ),
              Text(
                "${messages[i]['sentName']}",
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
          MyCircleAvatar(
            imgUrl: messages[i]['sentImgUrl'],
          ),
        ],
      ),
    );
  }
}
