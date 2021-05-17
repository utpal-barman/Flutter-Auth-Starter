import '../../../../services/api.dart';
import '../../../../widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({
    Key key,
  }) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController =
      MaskedTextController(mask: '000 - 000 - 0000');

  final _formKey = GlobalKey<FormState>();

  bool hadError = false;

  String firstName, lastName, phoneNumber;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
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
                keyboardType: TextInputType.name,
                onSaved: (newValue) => firstName = newValue,
                onChanged: (value) {
                  hadError ? _formKey.currentState.validate() : null;
                },
                validator: (value) =>
                    value.isEmpty ? "First name cannot be empty" : null,
                controller: _firstNameController,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30.0))),
                  labelText: 'First Name',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                onSaved: (newValue) => lastName = newValue,
                onChanged: (value) {
                  hadError ? _formKey.currentState.validate() : null;
                },
                validator: (value) =>
                    value.isEmpty ? "Last name cannot be empty" : null,
                controller: _lastNameController,
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(30.0))),
                  labelText: 'Last Name',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onSaved: (newValue) => phoneNumber = newValue,
                  onChanged: (value) {
                    hadError ? _formKey.currentState.validate() : null;
                  },
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            const Radius.circular(30.0))),
                    labelText: 'Phone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) return "Phone Number is empty";

                    if (value.length != 16) return "Valid USA number is needed";
                    return null;
                  }),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Button(
                  text: "Get Started",
                  onPressedButton: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      API().saveUserInfo(firstName, lastName, phoneNumber);
                      Navigator.of(context).popUntil((route) => route.isFirst);
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
