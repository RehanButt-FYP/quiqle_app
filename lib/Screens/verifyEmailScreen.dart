import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiqle_app/Screens/resetPasswordScreen.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:quiqle_app/Widgets/button.dart';
import 'dart:ui';
import 'package:quiqle_app/config/app_config.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyEmailScreen extends StatefulWidget {
  VerifyEmailScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool _unFocus = false;
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
                            'Verify Email Address',
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
                              TextSpan(text: 'Please enter the verification code',),
                              TextSpan(text: '\nsent to ',),
                              TextSpan(text: 'contact@elevow.com', style: TextStyle(fontFamily: 'Poppins-SemiBold',)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: PinPut(
                            fieldsCount: 4,
                            actionButtonsEnabled: false,
                            autoFocus: false,
                            spaceBetween: 30.0,
                          //  unFocusWhen: _unFocus,
                            inputDecoration: InputDecoration(
                              counterText: '',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width:3.0, color: kTextFieldHintColor)),
                            ),
                            onSubmit: (String pin) {
                              print(pin);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/14,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:50.0,),
                        child: Button(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                          },
                          buttonText: 'Verify',
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
                                TextSpan(text: 'Didn\'t receive the code?', style:TextStyle(color: kSubLabelColor),),
                                TextSpan(
                                  text: ' Resend',
                                  style: TextStyle(fontWeight: FontWeight.w700, color: kSecondaryColor),
                                ),
                              ],
                            ),
                          ),
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
          Colors.black,
          Colors.tealAccent,
        ],
        durations: [30000, 19440, 10800, 15000],
        heightPercentages: [0.02, 0.07, 0.10, 0.22],
        blur: _blur,
      ),
    );
  }

}
