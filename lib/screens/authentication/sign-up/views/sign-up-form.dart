import '../../../../config/constants.dart';
import 'package:flutter/material.dart';
import '../../../../screens/authentication/complete-profile/complete-profile-screen.dart';
import '../../../../services/auth-services.dart';
import '../../../../widgets/button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  var _isNotVisible1 = true;
  var _isNotVisible2 = true;

  final _formKey = GlobalKey<FormState>();

  bool hadError = false;

  String email, password;

  @override
  void dispose() {
    _emailController.clear();
    _passwordController1.clear();
    _passwordController2.clear();
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
                validator: (value) => value.isEmpty || !value.contains("@")
                    ? "Invalid email address"
                    : null,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
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
                controller: _passwordController1,
                obscureText: _isNotVisible1,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isNotVisible1
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isNotVisible1 = !_isNotVisible1;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    hadError = true;
                    return "Password is empty";
                  } else {
                    return null;
                  }
                },
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
                controller: _passwordController2,
                obscureText: _isNotVisible2,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
                  labelText: 'Repeat Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isNotVisible2
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isNotVisible2 = !_isNotVisible2;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    hadError = true;
                    return "Password is empty";
                  } else if (value != _passwordController1.value.text) {
                    print(value);
                    print(_passwordController2.value.text);
                    hadError = true;
                    return "Password mismatched";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 48,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Button(
                    text: "Register",
                    onPressedButton: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        var authResult = await AuthServices()
                            .signUpWithEmailPassword(email, password);
                        print(authResult);
                        if (authResult == "weak-password") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Weak Password, password must contain at least 6 charaters"),
                            ),
                          );
                        } else if (authResult == "email-already-in-use") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Email already in use, sign in instead"),
                            ),
                          );
                        } else if (authResult == "ok") {
                          Navigator.pushNamed(
                              context, CompleteProfileScreen.routeName);
                        } else if (authResult == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Something went wrong"),
                            ),
                          );
                        }
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
