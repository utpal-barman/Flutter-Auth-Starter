import 'package:flutter/material.dart';

import 'views/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static const routeName = '/complete-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Info"),
      ),
      body: BodyCompleteProfile(),
    );
  }
}
