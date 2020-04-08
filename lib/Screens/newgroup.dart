import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatGroup extends StatefulWidget {
  @override
  _CreatGroupState createState() => _CreatGroupState();
}

class _CreatGroupState extends State<CreatGroup> {


  bool isExpanded = false;


  List friendsList =[

    friend(
      img: 'images/pic1.png',
      title: "Jennifer Garcia"
    ),
    friend(
        img: 'images/pic2.jpg',
        title: "Serena Quinn"
    ),
    friend(
        img: 'images/pic3.jpg',
        title: "Francesca Viatore"
    ),
    friend(
        img: 'images/pic4.jpg',
        title: "Delaney Pearson"
    ),
    friend(
        img: 'images/pic5.png',
        title: "Elena Torres"
    ),
    friend(
        img: 'images/pic1.png',
        title: "Jennifer Garcia"
    ),
    friend(
        img: 'images/pic2.jpg',
        title: "Jennifer Garcia"
    ),

  ];



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
            "New Group",
            style: TextStyle(
                color: Colors.white,
                fontSize: height / 38,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.5
            ),
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
//              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Profile()));
            },
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width/1.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: height/40,),
                //heading
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "Workout Squad",
                      style: TextStyle(
                          fontSize: height/26,
                          fontWeight: FontWeight.w600

                      ),
                    ),
                    SizedBox(width: width/50,),
                    Icon(Icons.edit,color: Colors.black38,size: 18,)
                  ],
                ),

                SizedBox(height: height/50,),
                //frndlist
                Text(
                  "Friend List",textAlign: TextAlign.left,
                  style: TextStyle(fontSize: height/40),
                ),

                SingleChildScrollView(
                  child: Container(
                    height: height/1.5,
                    child: ListView(
                      children: List.generate(friendsList.length, (index) {
                        return ListTile(
                            onTap: () {
                              setState(() {
                                friendsList[index].selected = !friendsList[index].selected;
                                log( friendsList[index].selected.toString());

                              });
                            },
                            selected: friendsList[index].selected,
                            leading: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {},
                              child: Container(
                                width: 48,
                                height: 48,
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(friendsList[index].img)
                                ),
                              ),
                            ),
                            title: Text( friendsList[index].title),
                            trailing: (friendsList[index].selected) ? ClipOval(
                              child: Material(
                                color: Colors.green, // button color
                                child: SizedBox(width: 24, height: 24, child: Icon(Icons.check,color: Colors.white,size: 16,)),
                              ),
                            )
                                : null

                        );
                      }),
                    ),
                  ),
                ),


                Center(
                  child: ButtonTheme(
                    minWidth: width/1.2,
                    height: height/15,
                    child: FlatButton(

                      shape: new RoundedRectangleBorder(

                        borderRadius: new BorderRadius.circular(10.0),
                        //    side: BorderSide(color: Color(0xff2CBE77))
                      ),


                      color: Color(0xff45D4FF),
                      textColor: Colors.white,
                      child: Text(
                        "CREATE GROUP",
                        style: TextStyle(
                            fontSize: height / 50,
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
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


class friend {
  String img;
  String title;
  bool selected = false;

  friend({this.img, this.title,});

}