import 'dart:developer';

import 'package:flutter/material.dart';

enum WidgetMarker { going, unsure, cannotgo }

class HangoutAttendees extends StatefulWidget {
  @override
  _HangoutAttendeesState createState() => _HangoutAttendeesState();
}

class _HangoutAttendeesState extends State<HangoutAttendees> {
  List GoingList = [
    going(img: 'images/pic1.png', title: "Jennifer Garcia"),
    going(img: 'images/pic2.jpg', title: "Serena Quinn"),
    going(img: 'images/pic3.jpg', title: "Francesca Viatore"),
    going(img: 'images/pic4.jpg', title: "Delaney Pearson"),
  ];

  List UnsureList = [
    going(img: 'images/pic1.png', title: "Jennifer Garcia"),
    going(img: 'images/pic2.jpg', title: "Serena Quinn"),
    going(img: 'images/pic4.jpg', title: "Delaney Pearson"),
  ];

  List CannotGo = [
    going(img: 'images/pic4.jpg', title: "Delaney Pearson"),
  ];



  WidgetMarker selectedwidgetMarker = WidgetMarker.going;
  bool change = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff45D4FF),
        title: Text(
          "Members",
          style: TextStyle(
              color: Colors.white,
              fontSize: height / 30,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.5),
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // do something
          },
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Text("27"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height / 60,
            ),
            Container(
              width: width / 1.1,
              decoration: new BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedwidgetMarker = WidgetMarker.going;
                      });
                    },
                    child: Text(
                      "Going",
                      style: TextStyle(
                        color: (selectedwidgetMarker == WidgetMarker.going)
                            ? Color(0xff45D4FF)
                            : Colors.black38,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedwidgetMarker = WidgetMarker.unsure;
                      });
                    },
                    child: Text(
                      "Unsure",
                      style: TextStyle(
                          color: (selectedwidgetMarker == WidgetMarker.unsure)
                              ? Color(0xff45D4FF)
                              : Colors.black38),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        selectedwidgetMarker = WidgetMarker.cannotgo;
                      });
                    },
                    child: Text(
                      "Cannot Go",
                      style: TextStyle(
                          color: (selectedwidgetMarker == WidgetMarker.cannotgo)
                              ? Color(0xff45D4FF)
                              : Colors.black38),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 60,
            ),


            SingleChildScrollView(
              child: Container(
                height: height / 1.3,
                //color: Colors.blue,
                child: getCustomContainor(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCustomContainor() {
    switch (selectedwidgetMarker) {
      case WidgetMarker.going:
        return getGoingContainer();
      case WidgetMarker.unsure:
        return getunsureContainer();
      case WidgetMarker.cannotgo:
        return getcannotContainer();
    }
    return getGoingContainer();
  }

  Widget getGoingContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: GoingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                  onTap: () {
//                    setState(() {
//                      GoingList[index].selected = !GoingList[index].selected;
//                      log(GoingList[index].selected.toString());
//                    });
                  },
                  leading: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                          backgroundImage: AssetImage(GoingList[index].img)),
                    ),
                  ),
                  title: Text(GoingList[index].title),
                  trailing: (GoingList[index].selected)
          ? ClipOval(
          child: Material(
          color: Colors.green, // button color
          child: SizedBox(
          width: 24,
          height: 24,
          child: Icon(
          Icons.check,
          color: Colors.white,
          size: 16,
          )),
          ),
          )
              : null),
              Divider(),
            ],
          );
        },
//        children: List.generate(GoingList.length, (index) {
//          return
//        }),
      ),
    );
  }

  Widget getunsureContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: UnsureList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                  onTap: () {
//                    setState(() {
//                      UnsureList[index].selected = !UnsureList[index].selected;
//                      log(UnsureList[index].selected.toString());
//                    });
                  },
                  selected: UnsureList[index].selected,
                  leading: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                          backgroundImage: AssetImage(UnsureList[index].img)),
                    ),
                  ),
                  title: Text(UnsureList[index].title),
                  trailing: (UnsureList[index].selected)
                      ? ClipOval(
                    child: Material(
                      color: Colors.green, // button color
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          )),
                    ),
                  )
                      : null),
              Divider(),
            ],
          );
        },
//        children: List.generate(GoingList.length, (index) {
//          return
//        }),
      ),
    );
  }

  Widget getcannotContainer() {
    return Container(
      height: MediaQuery.of(context).size.height / 1,
      child: ListView.builder(
        itemCount: CannotGo.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                  onTap: () {
//                    setState(() {
//                      CannotGo[index].selected = !CannotGo[index].selected;
//                      log(CannotGo[index].selected.toString());
//                    });
                  },
                  selected: CannotGo[index].selected,
                  leading: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                          backgroundImage: AssetImage(CannotGo[index].img)),
                    ),
                  ),
                  title: Text(CannotGo[index].title),
                  trailing: (CannotGo[index].selected)
                      ? ClipOval(
                    child: Material(
                      color: Colors.green, // button color
                      child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          )),
                    ),
                  )
                      : null),
              Divider(),
            ],
          );
        },
//        children: List.generate(GoingList.length, (index) {
//          return
//        }),
      ),
    );
  }

  Widget play() {
    return Container(
      color: Colors.black38,
      height: 200,
      width: 300,
      child: Text(
        "Play",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget pause() {
    return Container(
      color: Colors.yellowAccent,
      height: 200,
      //child: Text("Pause"),
    );
  }
}

class going {
  String img;
  String title;
  bool selected = false;

  going({
    this.img,
    this.title,
  });
}
