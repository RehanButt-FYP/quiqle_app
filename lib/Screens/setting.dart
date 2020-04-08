import 'package:flutter/material.dart';

import 'profile.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {


    String firstname = "Miguel";
    String lastname = "Leal";
    String email = "contact@elevow.com";
    bool Pnotifiction = false;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff45D4FF),
          title:  Text(
            "Settings",
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width/1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: height/30,),

                  Text(
                    "Account Information",
                    style: TextStyle(
                     fontSize: height/30,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  Center(
                    child: Container(
                      width: width/1.3,
                      child: Column(
                        children: <Widget>[

                          SizedBox(height: height/50,),

                          //firstname formfield
                          Theme(
                            data: new ThemeData(
                                primaryColor: Colors.black26
                            ),
                            child: new TextFormField(
                              cursorColor: Colors.black54,
                              style: TextStyle(fontSize:height/50, color: Colors.black54,),

                              decoration: InputDecoration(

                                  prefixIcon: Icon(Icons.person),
                                contentPadding: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 0.0),

                                hintText: '$firstname',

                              ),
                              keyboardType: TextInputType.text,
                              //obscureText: true,
                            ),
                          ),

                          SizedBox(height: height/50,),

                          //lastname formfield
                          Theme(
                            data: new ThemeData(
                                primaryColor: Colors.black26
                            ),
                            child: new TextFormField(
                              cursorColor: Colors.black54,
                              style: TextStyle(fontSize:height/50, color: Colors.black54,),

                              decoration: InputDecoration(

                                prefixIcon: Icon(Icons.person),
                                contentPadding: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 0.0),

                                hintText: '$lastname',

                              ),
                              keyboardType: TextInputType.text,
                              //obscureText: true,
                            ),
                          ),


                          SizedBox(height: height/50,),

                          //email formfield
                          Theme(
                            data: new ThemeData(
                                primaryColor: Colors.black26
                            ),
                            child: new TextFormField(
                              cursorColor: Colors.black54,
                              style: TextStyle(fontSize:height/50, color: Colors.black54,),

                              decoration: InputDecoration(

                                prefixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 0.0),

                                hintText: '$email',

                              ),
                              keyboardType: TextInputType.text,
                              //obscureText: true,
                            ),
                          ),

                          SizedBox(height: height/40,),

                          Container(

                            width: width/1.3,
                            child: Text("To change your password please log out and select the forget password option",style:
                            TextStyle(
                              color: Colors.grey,
                              fontSize: height/60,
                              fontWeight: FontWeight.w600,
                            ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: height/6,),
                  Text(
                    "Notifications",
                    style: TextStyle(
                        fontSize: height/30,
                        fontWeight: FontWeight.w600,
                      letterSpacing: 1
                    ),

                  ),

                  SwitchListTile(
                    title: Text("Push Notification"),
                    value: Pnotifiction,
                    onChanged: (bool value) {
                      setState(() {
                        Pnotifiction = value;
                      });
                    },
                    // secondary: const Icon(Icons.lightbulb_outline),
                  ),






                ],
              ),

            ),
            Divider(),

            SizedBox(
              height: height/20,
            ),
            InkWell(
              onTap: () {
//            do something
              },
              child: Text(
                "Log Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: height/40,
                    color: Colors.redAccent,
                    letterSpacing: 0,
                  fontWeight: FontWeight.bold

                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
