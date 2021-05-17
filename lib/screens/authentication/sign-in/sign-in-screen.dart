import 'package:flutter/material.dart';

import 'views/body.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/sign-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: BodySignIn(),
    );
  }
}
