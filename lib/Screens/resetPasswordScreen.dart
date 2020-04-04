import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens/signInScreen.dart';
import 'package:quiqle_app/Screens/verifyEmailScreen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:quiqle_app/Widgets/button.dart';
import 'dart:ui';
import 'package:quiqle_app/config/app_config.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  _buildCard({Config config,}) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Center(
                      child: Text(
                        'Quiqle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          color: kMainColor,
                          fontFamily: 'Poppins-SemiBold',
                        ),
                      ),
                    ),
                    Container(
                      height: 250.0,
                      width: double.infinity,
                      child: WaveWidget(
                        heightPercentange: 50,
                        config: config,
                        backgroundColor: Colors.white,
                        size: Size(double.infinity, double.infinity),
                        waveAmplitude: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight:  Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 23, horizontal:30),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:20.0, bottom: 30.0,),
                        child: Center(
                          child: Text(
                            'Change Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: kTextFieldColor,
                              fontFamily: 'Poppins-M',
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.title.merge(
                              TextStyle(
                                fontFamily: 'Poppins-R',
                                fontSize: 17.0,
                                letterSpacing: 0.6,
                                color: kTextFieldIconColor,
                              ),
                            ),
                            children: [
                              TextSpan(text: 'Please enter and confirm your',),
                              TextSpan(text: '\nnew password.',),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height/12,
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: 'New Password',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: kTextFieldIconColor,
                                fontSize: kTextfieldLabelFontSize,
                                fontFamily: 'Poppins-R'),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:kMainColor)),
                          prefixIcon: Image.asset('images/password_icon.png', width: 15, height: 15,),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/30,
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: 'Re-enter Password',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: kTextFieldIconColor,
                                fontSize: kTextfieldLabelFontSize,
                                fontFamily: 'Poppins-R'),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:kMainColor)),
                          prefixIcon: Image.asset('images/password_icon.png', width: 15, height: 15,),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height/14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50.0,),
                        child: Button(
                          onTap: (){
                            },
                          buttonText: 'Reset Password',
                          width: double.infinity,
                        ),
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 20.0),
    MaskFilter.blur(BlurStyle.inner, 10.0),
    MaskFilter.blur(BlurStyle.outer, 10.0),
    MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return _buildCard(
      config: CustomConfig(
        colors: [
          Colors.blue,
          Colors.blue,
          Colors.tealAccent,
          Colors.black,
        ],
        durations: [30000, 19440, 10800, 15000],
        heightPercentages: [0.02, 0.07, 0.10, 0.18],
        blur: _blur,
      ),
    );
  }
}
