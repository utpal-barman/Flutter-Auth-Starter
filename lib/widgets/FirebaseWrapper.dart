import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseWrapper extends StatelessWidget {
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

  final Widget child;

  FirebaseWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialize,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return buildError();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return child;
          }

          return buildLoader();
        });
  }

  buildError() => Center();
  buildLoader() => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
