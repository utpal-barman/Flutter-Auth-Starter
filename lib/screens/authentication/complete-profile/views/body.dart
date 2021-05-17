import 'package:flutter/material.dart';
import '../../../../config/colors.dart';

import 'complete-profile-form.dart';

class BodyCompleteProfile extends StatelessWidget {
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
                "Complete your Profile",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Please fill up the form to get started",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              CompleteProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
