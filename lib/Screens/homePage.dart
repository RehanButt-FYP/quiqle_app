import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locat;

import 'package:flutter/cupertino.dart';
import 'package:quiqle_app/config/app_config.dart';

class HomePageMap extends StatefulWidget {
//  HomePageMap({@required Key key}) : super(key:key);
  @override
  HomePageMapState createState() => HomePageMapState();
}

class HomePageMapState extends State<HomePageMap> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String selectedOption;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //LatLng _initialPosition = LatLng(33.565109, 73.016914);
  final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(34.052235, -118.243683),
    zoom: 15,
  );
  GoogleMapController _controller;
  locat.Location _location = locat.Location();

  void _onMapCreated(GoogleMapController _ctrl)
  {
    _controller = _ctrl;
    _location.onLocationChanged().listen((l)
    {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: this._formKey,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: _initialCamera,
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: false,
              ),

              Positioned(
                top: 40.0,
                left: 20.0,
                child: InkWell(
                  onTap: ()
                  {

                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kMainColor, width: 4.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black45,
                          offset: new Offset(3.0, 3.0,),
                          blurRadius: 5.0,
                        )
                      ],
                      image: DecorationImage(image: AssetImage('images/person.jpg',), fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 40.0,
                right: 20.0,
                child: InkWell(
                  onTap: ()
                  {

                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage('images/chat_icon.png',), fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 40.0,
                right: 120.0,
                left: 120.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      iconEnabledColor: Colors.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      hint: Text('Select', textAlign: TextAlign.center, style: TextStyle(color: Colors.white,),),
                      value: selectedOption,

                      items: ["Friends", "Groups", "Hangouts",]
                          .map((label) => DropdownMenuItem(
                        child: Text(label, style: TextStyle(color: Colors.black45,),),
                        //color: Color(0xFF3E88FF),
                        value: label,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() =>  selectedOption = value);
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),

                    color: Color(0xff45D4FF),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}


