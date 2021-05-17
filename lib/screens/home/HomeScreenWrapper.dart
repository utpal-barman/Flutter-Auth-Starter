import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_listener_cubit.dart';
import '../../screens/authentication/sign-in/sign-in-screen.dart';
import '../../services/auth-services.dart';
import '../../widgets/button.dart';

class HomeScreenWrapper extends StatefulWidget {
  @override
  _HomeScreenWrapperState createState() => _HomeScreenWrapperState();
}

class _HomeScreenWrapperState extends State<HomeScreenWrapper> {
  final authInstance = FirebaseAuth.instance.authStateChanges();

  StreamSubscription<User> authListener;

  @override
  void initState() {
    super.initState();
    authListener = authInstance.listen((User user) {
      print(user?.email);
      if (user == null) {
        context.read<AuthListenerCubit>().authLoadedWithNoUser();
      } else {
        context.read<AuthListenerCubit>().authLoadedWithUser(user.email);
      }
    });
  }

  @override
  void dispose() {
    authListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("main wrapper is building");

    return BlocBuilder<AuthListenerCubit, AuthListenerState>(
        builder: (context, state) {
      if (state is AuthListenerLoadedWithNoUser) {
        return SignInScreen();
      } else if (state is AuthListenerLoadedWithUser) {
        return HomeScreen();
      } else {
        return buildLoader();
      }
    });
  }

  buildLoader() => Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      );
}

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Column(
          children: [
            Center(
              child: Text("This is home Screen"),
            ),
            Button(
              text: "Logout",
              onPressedButton: () {
                AuthServices().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
