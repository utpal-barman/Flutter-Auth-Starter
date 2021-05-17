import 'package:flutter/material.dart';
import '../../../../config/colors.dart';

import 'reset-form.dart';

class BodyReset extends StatelessWidget {
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
                "Reset Password",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Enter email to continue",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              ResetForm(),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Need Help?"),
                  SizedBox(
                    width: 4,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    onTap: () {},
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
