import 'package:flutter/material.dart';

class CardContant extends StatelessWidget {
  final int cardNum;
  CardContant(this.cardNum);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(

      decoration: new BoxDecoration(
          color: Colors.white70,
          borderRadius: new BorderRadius.circular(30)
      ),
      child: Card(
        color: Color(0xff45D4FF),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
      ),
        //color:Color(0xff45D4FF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
//              decoration: new BoxDecoration(
//                gradient: new LinearGradient(
//                    colors: [
//                      const Color(0xFF3366FF),
//                      const Color(0xFF00CCFF),
//                    ],
//                    begin: const FractionalOffset(0.0, 0.0),
//                    end: const FractionalOffset(1.0, 0.0),
//                    stops: [0.0, 1.0],
//                    tileMode: TileMode.clamp),
//              ),
                padding: EdgeInsets.symmetric(vertical: 32.0,horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   Text("Kickback Relax!",style: TextStyle(fontSize:height/30,color: Colors.white,fontWeight: FontWeight.w600 ),),
                    SizedBox(height: height/60,),
                    Container(
                      width: width/1.7,
                      child: Text("Join us for some beer and crackers..for the boys!",style:
                      TextStyle(
                        fontSize: height/50,
                        color: Colors.white,
                        wordSpacing: 2,
                      ),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: height/60,),
                    Text("DATE",style: TextStyle(fontSize:height/40,color: Colors.white54,fontWeight: FontWeight.w400 ),),
                    SizedBox(height: height/60,),
                    Text("December 26th,2020",style: TextStyle(fontSize:height/50,color: Colors.white,fontWeight: FontWeight.w400 ),),
                    SizedBox(height: height/60,),
                    Text("TIME",style: TextStyle(fontSize:height/40,color: Colors.white54,fontWeight: FontWeight.w400 ),),
                    SizedBox(height: height/60,),
                    Text("8:00PM",style: TextStyle(fontSize:height/50,color: Colors.white,fontWeight: FontWeight.w400 ),),
                    SizedBox(height: height/60,),
                    Text("LOCATION",style: TextStyle(fontSize:height/40,color: Colors.white54,fontWeight: FontWeight.w400 ),),
                    SizedBox(height: height/60,),
                    Text("141 Rivoli St. San Francisco, CA 94117",style: TextStyle(fontSize:height/50,color: Colors.white,fontWeight: FontWeight.w400 ),),
SizedBox(height: height/30,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: width / 2.8,
                          decoration: new BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: new BorderRadius.circular(24),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
//                            setState(() {
//                              selectedwidgetMarker = WidgetMarker.going;
//                            });
                                },
                                child: Text(
                                  "DECLINE",
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          width: width / 2.8,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(24),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
//                            setState(() {
//                              selectedwidgetMarker = WidgetMarker.going;
//                            });
                                },
                                child: Text(
                                  "ACCEPT",
                                  style: TextStyle(
                                      color: Colors.black
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}