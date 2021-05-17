import '../../../../config/constants.dart';
import 'package:flutter/material.dart';
import '../../../../services/auth-services.dart';
import '../../../../widgets/button.dart';

class ResetForm extends StatefulWidget {
  const ResetForm({
    Key key,
  }) : super(key: key);

  @override
  _ResetFormState createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool hadError = false;

  String email, password;

  @override
  void dispose() {
    _emailController.clear();
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
                validator: (value) {
                  if (value.isEmpty || !value.contains("@")) {
                    hadError = true;
                    return "Invalid email address";
                  } else {
                    return null;
                  }
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(kBorderRadius))),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Button(
                  text: "Reset Password",
                  onPressedButton: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      try {
                        await AuthServices.resetPassword(_emailController.text);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please check your mail"),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("$e"),
                          ),
                        );
                      }
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
