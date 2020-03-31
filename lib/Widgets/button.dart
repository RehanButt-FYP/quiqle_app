import 'package:flutter/material.dart';
import 'package:quiqle_app/config/app_config.dart' as config;

class Button extends StatelessWidget {

  Button({@required this.onTap, @required this.buttonText, @required this.width});
  final String buttonText;
  final Function onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //height: config.App(context).appHeight(8),
        width: width,
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: config.kHeadingFontSize,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: config.kMainColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 4.0,
                color: Colors.black54.withOpacity(0.2),
                spreadRadius: 0.8)
          ],
        ),
      ),
    );
  }
}
