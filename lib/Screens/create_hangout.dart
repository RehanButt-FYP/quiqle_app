import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'dart:async';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

const kGoogleApiKey = "AIzaSyDaT2KA0sFOlP_FW54S9o9NCZY3BCZ7yRQ";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);




class CreateHangout extends StatefulWidget {
  @override
  _CreateHangoutState createState() => _CreateHangoutState();
}

class _CreateHangoutState extends State<CreateHangout> {

  int _hour = 2;
  int _min=30;

  Mode _mode = Mode.overlay;

  DateTime selecttime = DateTime.now();

  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }





  final homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: homeScaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff45D4FF),
          title:  Text(
            "Hangout Details",
            style: TextStyle(
                color: Colors.white,
                fontSize: height / 36,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.5
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width/1.1,
            child: Column(
mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(height: height/50,),
                Row(
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "Workout Squad",
                      style: TextStyle(
                          fontSize: height/28,
                          fontWeight: FontWeight.w600,
                        color: Colors.blue
                      ),
                    ),
                    SizedBox(width: width/50,),
                    Icon(Icons.people,color: Colors.black38,size: 18,)
                  ],
                ),

                //name
                SizedBox(height: height/40,),
                Row(
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "NAME",
                      style: TextStyle(
                          fontSize: height/58,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38
                      ),
                    ),
                    SizedBox(width: width/60,),
                    Icon(Icons.edit,color: Colors.black38,size: 12,)
                  ],
                ),
                Theme(
                  data: new ThemeData(
                      primaryColor: Colors.black
                  ),
                  child: new TextFormField(
                    cursorColor: Colors.black54,
                    style: TextStyle(fontSize:height/50, color: Colors.black,),

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 0.0),
                      hintText: 'Hiking',
                      hintStyle: TextStyle(color: Colors.black),

                    ),
                    keyboardType: TextInputType.text,
                    //obscureText: true,
                  ),
                ),


                //date
                SizedBox(height: height/40,),
                Row(
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "DATE",
                      style: TextStyle(
                          fontSize: height/58,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38
                      ),
                    ),
                    SizedBox(width: width/60,),
                    Icon(Icons.date_range,color: Colors.black38,size: 12,)
                  ],
                ),
                SizedBox(height: height/60,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ButtonTheme(
                    minWidth: width/5,
                    height: height/18,
                    child: FlatButton.icon(

                      shape: new RoundedRectangleBorder(


                        borderRadius: new BorderRadius.circular(10.0),
                        //    side: BorderSide(color: Color(0xff2CBE77))
                      ),


                      color: Color(0xff45D4FF),
                      textColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      label: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(
                            fontSize: height / 50,
                            fontWeight: FontWeight.w500
                          //letterSpacing: 1
                        ),

                      ),


                      onPressed: () {
                      _selectDate(context);
                      },
                    ),
                  ),
                ),


                //time
                SizedBox(height: height/40,),
                Row(
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "TIME",
                      style: TextStyle(
                          fontSize: height/58,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38
                      ),
                    ),
                    SizedBox(width: width/60,),
                    Icon(Icons.access_time,color: Colors.black38,size: 12,)
                  ],
                ),

               // hourMinute12HCustomStyle(),

                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_up,
                            color: Colors.grey,
                          ),
                          onPressed: () {

                           //add();
                          },
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          onPressed: () {

                          //  minus();
                          },
                        ),

                      ],
                    ),
                    new Text(
                      '$_hour',
                      style: TextStyle(fontSize: height/20,fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(width: width/20,),
                    Text(
                      ":",
                      style: TextStyle(fontSize: height/20,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: width/20,),
                    Text(
                      '$_min',
                      style: TextStyle(fontSize: height/20,fontWeight: FontWeight.bold
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_up,
                            color: Colors.grey,
                          ),
                          onPressed: () {

                           // plus();
                          },
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          ),
                          onPressed: () {

                           // mines();
                          },
                        ),

                      ],
                    ),

                    ButtonTheme(
                      minWidth: width/90,
                      height: height/20,
                      child: FlatButton(

                        shape: new RoundedRectangleBorder(

                          borderRadius: new BorderRadius.circular(10.0),
                          //    side: BorderSide(color: Color(0xff2CBE77))
                        ),


                        color: Color(0xff45D4FF),
                        textColor: Colors.white,
                        child: Text(
                          "AM",
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
                    SizedBox(width: width/40,),
                    ButtonTheme(
                      minWidth: width/90,
                      height: height/20,
                      child: FlatButton(

                        shape: new RoundedRectangleBorder(

                          borderRadius: new BorderRadius.circular(10.0),
                          //    side: BorderSide(color: Color(0xff2CBE77))
                        ),


                        color: Colors.grey,
                        textColor: Colors.white,
                        child: Text(
                          "PM",
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


                  ],
                ),



                //Location
                SizedBox(height: height/40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: width/50,),
                        Text(
                          "LOCATION",
                          style: TextStyle(
                              fontSize: height/58,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38
                          ),
                        ),
                        SizedBox(width: width/60,),
                        Icon(Icons.location_on,color: Colors.black38,size: 12,)
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      onPressed: () {

                         _handlePressButton();
                      },
                    ),
                  ],
                ),
             SizedBox(height: height/60,),
             new Container(
               height: height/12,
              decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage(
                        'images/map.PNG'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.green,
                  borderRadius: new BorderRadius.circular(12)
              ),

             ),
                Row(
                  children: <Widget>[
                    SizedBox(width: width/50,),
                    Text(
                      "Use Current location?",
                      style: TextStyle(
                          fontSize: height/58,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 14,
                      ),
                      onPressed: () {



                      },
                    ),
                  ],
                ),




                //description
                SizedBox(height: height/30,),
                Text(
                  "DESCRIPTION (optional)",
                  style: TextStyle(
                      fontSize: height/58,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38
                  ),
                ),
                SizedBox(height: height/60,),
                Container(


                  child: Text("Hiking day to replenish the leg days that have been missed!",style:
                  TextStyle(
                    fontSize: height/50,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2,
                  ),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: height/60,),




                //button
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


  Widget hourMinute12H(){
    return new TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          selecttime = time;
        });
      },
    );
  }
  Widget hourMinuteSecond(){
    return new TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          selecttime = time;
        });
      },
    );
  }
  Widget hourMinute15Interval(){
    return new TimePickerSpinner(
      spacing: 40,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          selecttime = time;
        });
      },
    );
  }
  Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
//      normalTextStyle: TextStyle(
//          fontSize: 24,
//          color: Colors.blue
//      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Color(0xff45D4FF),
      ),
      spacing: 20,
      itemHeight: 60,
      isForce2Digits: false,
//      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          selecttime = time;
        });
      },
    );
  }


  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: "fr",
      components: [Component(Component.country, "fr")],
    );

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }



  void minus() {
    setState(() {
      if (_hour != 0)
        _hour--;
    });
  }

  void add() {
    setState(() {
      if(_hour<12)
        _hour++;
    });
  }

  void plus() {
    setState(() {
      if(_min  <59)
        _min++;
    });
  }

  void mines() {
    setState(() {
      if (_min != 0 )
        _min--;
    });
  }


}
