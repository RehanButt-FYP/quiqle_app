import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Widgets/cardDraggble.dart';

class InvitedHangout extends StatefulWidget {
  @override
  _InvitedHangoutState createState() => _InvitedHangoutState();
}

class _InvitedHangoutState extends State<InvitedHangout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff45D4FF),
        title: Text(
          "Workout Squad",
          style: TextStyle(
              color: Colors.white,
              fontSize: height / 38,
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
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => setting()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height / 60,
            ),

            Text(
              "Invited Hangouts",
              style: TextStyle(
                  fontSize: height / 30,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: height / 60,
            ),

            //cards
            Container(
              height: height / 1.6,
              child: Column(
                children: <Widget>[
                  CardsSectionDraggable(),
                  Text("Swipe to view next invitation",
                      style: TextStyle(
                          fontSize: height / 60,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),

            SizedBox(
              height: height / 60,
            ),
            Container(
              width: width / 1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Group QR Code",
                    style: TextStyle(
                        fontSize: height / 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Text("Your Friend need to scan this code to join the group",
                      style: TextStyle(
                          fontSize: height / 60,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500)),
                  Center(
                    child: Image(
                        image: AssetImage(
                      "images/QR.png",
                    )),
                  ),
                  Text("Going",
                      style: TextStyle(
                          fontSize: height / 30,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height / 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: height / 6,
                        width: width / 3.4,
                        decoration: new BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: new BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "12:30PM",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: height / 45),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Joson\'s ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "birthday",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height / 6,
                        width: width / 3.4,
                        decoration: new BoxDecoration(
                            color: Colors.orange,
                            borderRadius: new BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "12:30PM",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: height / 45),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Joson\'s ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "birthday",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height / 6,
                        width: width / 3.4,
                        decoration: new BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: new BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12, left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "12:30PM",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.white, fontSize: height / 45),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Joson\'s ",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "birthday",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: height / 50),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text("Jason\'s Birthday",
                      style: TextStyle(
                          fontSize: height / 26,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: height / 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "DATE",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    width: width / 60,
                                  ),
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width / 4,
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Today",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: height / 30),
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "TIME",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    width: width / 60,
                                  ),
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "12:30PM",
                                style: TextStyle(
                                    color: Colors.black, fontSize: height / 32),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "LOCATION",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    width: width / 60,
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                              Container(
                                height: height / 7,
                                width: width / 2.2,
                                decoration: new BoxDecoration(
                                    image: DecorationImage(
                                      image: new AssetImage('images/map.PNG'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.green,
                                    borderRadius:
                                        new BorderRadius.circular(12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 120,
                      ),
                      Text(
                        "GOING",
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: height / 50),
                      ),
                      SizedBox(
                        height: height / 120,
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
                                backgroundImage: AssetImage("images/pic1.png")),
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
                                backgroundImage: AssetImage("images/pic3.jpg")),
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
                                backgroundImage: AssetImage("images/pic2.jpg")),
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
                      Row(
                        children: <Widget>[
                          Text(
                            "DESCRIPTION:",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: height / 50),
                          ),
                          Text(
                            "   HAPPY BIRTHDAY Jason!",
                            style: TextStyle(
                                color: Colors.black, fontSize: height / 50),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: width / 3.4,
                            height: height / 14,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                //    side: BorderSide(color: Color(0xff2CBE77))
                              ),
                              color: Color(0xff45D4FF),
                              textColor: Colors.white,
                              child: Icon(
                                Icons.chat,
                                size: 29,
                              ),
                              onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => login()));
                              },
                            ),
                          ),
                          ButtonTheme(
                            minWidth: width / 1.9,
                            height: height / 14,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                //    side: BorderSide(color: Color(0xff2CBE77))
                              ),
                              color: Color(0xff45D4FF),
                              textColor: Colors.white,
                              child: Text(
                                "CLOSE",
                                style: TextStyle(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w500
                                    //letterSpacing: 1
                                    ),
                              ),
                              onPressed: () {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => login()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
