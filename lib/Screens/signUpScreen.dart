import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens/signInScreen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:quiqle_app/Widgets/button.dart';
import 'dart:ui';
import 'package:quiqle_app/config/app_config.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal:30),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:20.0, bottom: 10.0, left: 10.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                color: kTextFieldColor,
                                fontFamily: 'Poppins-M',
                              ),
                            ),

                            CircleAvatar(
                              backgroundImage: AssetImage('images/camera_icon.png',),
                              radius: 40,
                              backgroundColor: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: 'First Name',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: kTextFieldIconColor,
                                fontSize: kTextfieldLabelFontSize,
                                fontFamily: 'Poppins-R'),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:kMainColor)),
                          prefixIcon: Image.asset('images/user_icon.png', width: 20, height: 20,),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: kTextFieldIconColor,
                                fontSize: kTextfieldLabelFontSize,
                                fontFamily: 'Poppins-R'),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:kMainColor)),
                          prefixIcon: Image.asset('images/user_icon.png', width: 20, height: 20,),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                            TextStyle(color: kTextFieldIconColor,
                                fontSize: kTextfieldLabelFontSize,
                                fontFamily: 'Poppins-R'),
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:kMainColor)),
                          prefixIcon: Image.asset('images/email_icon.png', width: 15, height: 15, ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(color: kTextFieldColor,
                          fontSize:kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: 'Password',
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
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50.0,),
                        child: Button(
                          onTap: (){},
                          buttonText: 'Submit',
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.title.merge(
                                TextStyle(
                                  fontFamily: 'Poppins-R',
                                  fontSize: 14.0,
                                  letterSpacing: 0.8,
                                ),
                              ),
                              children: [
                                TextSpan(text: 'Already have an account?', style:TextStyle(color: kSubLabelColor),),
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(fontWeight: FontWeight.w700, color:kSecondaryColor),
                                  recognizer: new TapGestureRecognizer()..onTap = () =>
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen())),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
    return _buildCard(
        config: CustomConfig(
          colors: [
            Colors.black,
            Colors.black,
            Colors.tealAccent,
            Colors.blue
          ],
          durations: [30000, 19440, 10800, 15000],
          heightPercentages: [0.02, 0.07, 0.10, 0.20],
          blur: _blur,
        ),
    );
  }
}
