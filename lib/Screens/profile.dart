import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens/setting.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    String name = "Miguel Leal";

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff45D4FF),
        title: Text(
          "Profile",
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
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => setting()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height / 10,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(60.0),
                        border:
                            new Border.all(width: 3.0, color: Colors.black54)),
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage("images/people1.png"),
                      maxRadius: height / 15,
                      minRadius: height / 15,
                    ),
                  ),
                  Positioned(
                    left: 85,
                    top: 70,
                    child: Container(
                      height: height / 25,
                      width: width / 25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 55,
              ),
              Text(
                "$name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 35,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: height / 10,
              ),
              Container(
                width: width / 1.8,
                child: Text(
                  "People Can add you as a friend with this QR code",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: height / 50,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: height / 25,
              ),
              Image(
                  image: AssetImage(
                "images/QR.png",
              ))
            ],
          ) /* add child content here */,
        ),
      ),
    );
  }
}
