import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:quiqle_app/Screens/homePage.dart';
import 'package:quiqle_app/Screens/signInScreen.dart';
import 'package:quiqle_app/Widgets/button.dart';
import 'package:quiqle_app/config/app_config.dart';
import 'package:quiqle_app/config/app_config.dart' as config;
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

void attemptSignp() async {}

class _SignUpScreenState extends State<SignUpScreen> {
  File _image;
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  Firestore _fireStore;
  FirebaseUser _firebaseUser;
  FirebaseAuth _auth;
  FirebaseStorage _storage;

  ProgressDialog _progressDialog;

  void _getFirebaseReference() {
    _fireStore = Firestore.instance;
    _auth = FirebaseAuth.instance;
    _storage = FirebaseStorage.instance;
  }

  void _askForImage() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Image Source"),
        actions: <Widget>[
          MaterialButton(
            child: Text("Camera"),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
          MaterialButton(
            child: Text("Gallery"),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          ),
        ],
      ),
    );

    if (imageSource != null) {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null) {
        setState(() => _image = file);
        _showToast("Image Selected");
      }
    }
  }

  void _attemptSignup() async {
    _getFirebaseReference();

    _progressDialog = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);

    await _progressDialog.show();

    String firstName = _firstName.text;
    String lastName = _lastName.text;
    String email = _email.text;
    String password = _password.text;

    if (firstName.isEmpty) {
      _showToast("First Name Required");
      _progressDialog.dismiss();
    } else if (lastName.isEmpty) {
      _showToast("Last Name Required");
      _progressDialog.dismiss();
    } else if (email.isEmpty) {
      _showToast("Email Required");
      _progressDialog.dismiss();
    } else if (password.isEmpty) {
      _showToast("Password Required");
      _progressDialog.dismiss();
    } else if (password.length < 6) {
      _showToast("Password is Weak");
      _progressDialog.dismiss();
    } else if (!EmailValidator.validate(email)) {
      _showToast("Invalid Email");
      _progressDialog.dismiss();
    } else if (_image == null) {
      _showToast("Please select an image");
      _progressDialog.dismiss();
    } else {
      signInWithEmailAndPassword(firstName, lastName, email, password);
    }
  }

  void signInWithEmailAndPassword(
      String firstName, String lastName, String email, String password) async {
    _firebaseUser = (await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .catchError((error) {
      print(error.toString());
      _progressDialog.dismiss();
    }))
        .user;

    if (_firebaseUser != null) {
      // Saving the picture to firebase
      Future<String> downloadUrl = uploadImage();
      UserUpdateInfo userInfo = new UserUpdateInfo();
      downloadUrl.then((value) => {
            if (value.toString() != null) {userInfo.photoUrl = value.toString()}
          });

      userInfo.displayName = firstName + " " + lastName;
      await _firebaseUser.updateProfile(userInfo);
      await _firebaseUser.reload();

      _progressDialog.dismiss();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePageMap()));
    }
  }

  Future<String> uploadImage() async {
    // Saving the picture to firebase
    StorageUploadTask task = _storage
        .ref()
        .child("profile_pictures")
        .child(_firebaseUser.uid)
        .putFile(_image);

    String downloadUrl = await (await task.onComplete).ref.getDownloadURL();

    return downloadUrl;
  }

  _buildCard({Config config}) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
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
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
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
                            FlatButton(
                              onPressed: _askForImage,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  'images/camera_icon.png',
                                ),
                                radius: 40,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: _firstName,
                        style: TextStyle(
                          color: kTextFieldColor,
                          fontSize: kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: 'First Name',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                                TextStyle(
                                    color: kTextFieldIconColor,
                                    fontSize: kTextfieldLabelFontSize,
                                    fontFamily: 'Poppins-R'),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor)),
                          prefixIcon: Image.asset(
                            'images/user_icon.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _lastName,
                        style: TextStyle(
                          color: kTextFieldColor,
                          fontSize: kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          hintText: 'Last Name',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                                TextStyle(
                                    color: kTextFieldIconColor,
                                    fontSize: kTextfieldLabelFontSize,
                                    fontFamily: 'Poppins-R'),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor)),
                          prefixIcon: Image.asset(
                            'images/user_icon.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _email,
                        style: TextStyle(
                          color: kTextFieldColor,
                          fontSize: kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: new InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                                TextStyle(
                                    color: kTextFieldIconColor,
                                    fontSize: kTextfieldLabelFontSize,
                                    fontFamily: 'Poppins-R'),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor)),
                          prefixIcon: Image.asset(
                            'images/email_icon.png',
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _password,
                        style: TextStyle(
                          color: kTextFieldColor,
                          fontSize: kTextfieldLabelFontSize,
                          fontFamily: 'Poppins-M',
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                                TextStyle(
                                    color: kTextFieldIconColor,
                                    fontSize: kTextfieldLabelFontSize,
                                    fontFamily: 'Poppins-R'),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kTextFieldBorderColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kMainColor)),
                          prefixIcon: Image.asset(
                            'images/password_icon.png',
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                        ),
                        child: Button(
                          onTap: _attemptSignup,
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
                                TextSpan(
                                  text: 'Already have an account?',
                                  style: TextStyle(color: kSubLabelColor),
                                ),
                                TextSpan(
                                  text: ' Sign In',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: kSecondaryColor),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignInScreen())),
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
        colors: [Colors.black, Colors.black, Colors.tealAccent, Colors.blue],
        durations: [30000, 19440, 10800, 15000],
        heightPercentages: [0.02, 0.07, 0.10, 0.20],
        blur: _blur,
      ),
    );
  }

  void _showToast(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: config.kMainColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void initState() {
    super.initState();
    _getFirebaseReference();
    FirebaseAuth.instance.onAuthStateChanged.listen((event) {
      if (event != null) {}
    });
  }
}
