import '../config/constants.dart';
import 'package:flutter/material.dart';
import '../config/colors.dart';

class Button extends StatelessWidget {
  final String text;

  final Function onPressedButton;

  const Button({
    Key key,
    this.text,
    this.onPressedButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius)),
        onPressed: onPressedButton,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Text(text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        color: kPrimaryColor,
        textColor: Colors.white,
      ),
    );
  }
}
