import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quiqle_app/Screens/forgotPasswordScreen.dart';
import 'package:quiqle_app/Screens/homePage.dart';
import 'package:quiqle_app/Screens/signUpScreen.dart';
import 'package:quiqle_app/Widgets/button.dart';
import 'dart:ui';
import 'package:quiqle_app/config/app_config.dart' as config;
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _showPassword = false;
  double sigmaX = 0.0; // from 0-10
  double sigmaY = 0.0; // from 0-10
  double _opacity = 0.1; // from 0-1.0

  /* Input Fields For Email and Password
  * */
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _attempLogin(){
    String email = _emailController.text;
    String password = _passwordController.text;

    if(EmailValidator.validate(email)){

    }else if(email.isEmpty){
        _showToast("Please enter email");
    }else{
      _showToast("Please enter valid email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: new Container(
                  decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background_map.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter
                  )
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
                padding: EdgeInsets.all(23),
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Quiqle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 60,
                          color: config.kMainColor,
                          fontFamily: 'Poppins-SemiBold',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(color: config.kTextFieldColor,
                        fontSize: config.kTextfieldLabelFontSize,
                        fontFamily: 'Poppins-M',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                        hintText: 'Email',
                        hintStyle: Theme.of(context).textTheme.body1.merge(
                          TextStyle(color: config.kTextFieldHintColor,
                              fontSize: config.kTextfieldLabelFontSize,
                              fontFamily: 'Poppins-R'),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: config.kTextFieldBorderColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: config.kMainColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: config.kMainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: TextStyle(color: config.kTextFieldColor,
                        fontSize: config.kTextfieldLabelFontSize,
                        fontFamily: 'Poppins-M',
                      ),
                      obscureText: !_showPassword,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        hintStyle: Theme.of(context).textTheme.body1.merge(
                          TextStyle(color: config.kTextFieldHintColor,
                              fontSize: config.kTextfieldLabelFontSize,
                              fontFamily: 'Poppins-R'),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: config.kTextFieldBorderColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: config.kMainColor)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: config.kMainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPasswordScreen()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'Poppins-R',
                              fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: config.kSecondaryColor
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:50.0,),
                      child: Button(
                        onTap: _attempLogin,
                        buttonText: 'Sign In',
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70),
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
                              TextSpan(text: 'Don\'t have an account?', style:TextStyle(color: config.kSubLabelColor),),
                              TextSpan(
                                text: ' Register',
                                style: TextStyle(fontWeight: FontWeight.w700, color: config.kSecondaryColor),
                                recognizer: new TapGestureRecognizer()..onTap = () =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen())),
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
    );
  }

  void _showToast(String message, ){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: config.kSecondaryColor,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}
