import 'package:flutter/material.dart';
import '../../../../config/colors.dart';
import '../../../../config/constants.dart';
import '../../../../screens/authentication/sign-up/sign-up-screen.dart';

import 'sign-in-form.dart';

class BodySignIn extends StatelessWidget {
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
              //TODO: ADD LOGO
              // Container(
              //   width: MediaQuery.of(context).size.height * 0.1,
              //   padding: const EdgeInsets.all(8.0),
              //   child: Image.asset("assets/logo.jpg"),
              // ),
              SizedBox(
                height: 18,
              ),
              Text(
                kAppName,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Sign in with your email and password",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              SignInForm(),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have any account?"),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
