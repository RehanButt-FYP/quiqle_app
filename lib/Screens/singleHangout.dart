import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Widgets/widgets.dart';

import 'global.dart';

class SingleHangout extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<SingleHangout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height / 40,
                ),
                Container(
                  color: Colors.white,
                  height: height / 2.8,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Color(0xff45D4FF),
                          size: 28,
                        ),
                        onPressed: () {
//                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));
                        },
                      ),
                      Center(
                        child: Container(
                          width: width / 1.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Kick back",
                                        style: TextStyle(
                                          fontSize: height / 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        "workout squad",
                                        style: TextStyle(
                                          fontSize: height / 60,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "8:00PM",
                                        style: TextStyle(
                                          fontSize: height / 30,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        "October 10th,2020",
                                        style: TextStyle(
                                          fontSize: height / 60,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 80,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.redAccent,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(.3),
                                            offset: Offset(0, 2),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/people1.png")),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(.3),
                                            offset: Offset(0, 2),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/pic1.png")),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.yellow,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(.3),
                                            offset: Offset(0, 2),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/pic3.jpg")),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(.3),
                                            offset: Offset(0, 2),
                                            blurRadius: 5)
                                      ],
                                    ),
                                    child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("images/pic2.jpg")),
                                  ),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Color(0xff45D4FF),
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff45D4FF),
                                            offset: Offset(0, 2),
                                            blurRadius: 7)
                                      ],
                                    ),
                                    child: Text("7+"),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "1234 Rell Lane, Miami, FL.",
                                style: TextStyle(
                                  fontSize: height / 60,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Container(
                                child: Text(
                                  "Hiking day to replenish the leg days that have been missed!",
                                  style: TextStyle(
                                      fontSize: height / 60,
                                      fontWeight: FontWeight.w600,
                                      wordSpacing: 2,
                                      color: Colors.grey),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 3,
                  color: Colors.red,
                ),
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
