import 'package:flutter/material.dart';

import 'views/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: BodyReset(),
    );
  }
}
