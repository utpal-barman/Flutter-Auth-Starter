import '../../../../config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/sign_in_button_cubit.dart';
import '../../../../screens/authentication/reset-password/reset-password.dart';

import '../../../../widgets/button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key key,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var _isNotVisible = true;

  final _formKey = GlobalKey<FormState>();

  bool hadError = false;

  String email, password;

  var isButtonLoading = false;

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) {
                  email = newValue;
                },
                onChanged: (value) {
                  hadError ? _formKey.currentState.validate() : null;
                },
                validator: (value) =>
                    value.isEmpty ? "Email or Username is required" : null,
                controller: _emailController,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
                  labelText: 'Email or Username',
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextFormField(
                onSaved: (newValue) {
                  password = newValue;
                },
                onChanged: (value) {
                  hadError ? _formKey.currentState.validate() : null;
                },
                controller: _passwordController,
                obscureText: _isNotVisible,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isNotVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isNotVisible = !_isNotVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    hadError = true;
                    return "Password is required";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 32,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, ResetPasswordScreen.routeName);
              },
              child: Text("Forgot Password?"),
            ),
            SizedBox(
              height: 28,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: BlocConsumer<SignInButtonCubit, SignInButtonState>(
                  listener: (context, state) {
                    if (state is SignInButtonError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errorMessage)));
                    }
                  },
                  builder: (context, state) {
                    print(state.runtimeType);
                    if (state is SignInButtonLoading) {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    } else {
                      return Button(
                        text: "Sign in",
                        onPressedButton: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            context
                                .read<SignInButtonCubit>()
                                .signInUser(email, password);
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
