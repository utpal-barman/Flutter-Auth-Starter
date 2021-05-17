import 'package:flutter/material.dart';
import '../../../../config/colors.dart';
import '../../../../screens/authentication/sign-up/views/sign-up-form.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                "Create An Account",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                " Complete your details below",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
