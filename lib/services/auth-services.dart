import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

// sign in
  signInWithEmailPassword(_email, _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print("data: sign in sucessful");
      return "ok";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No users found");
        return "No users found";
      } else if (e.code == 'wrong-password') {
        print("The password is wrong");
        return "You entered wrong password";
      }
    }
    return null;
  }

// sign up
  signUpWithEmailPassword(email, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("data: signup success: user crendentials");
      return "ok";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('data: error: The password provided is too weak.');
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        print('data: error: he account already exists for that email.');
        return e.code;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //reset password
  static resetPassword(email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      print(e.message);
      throw e.message;
    }
  }

// sign out
  signOut() {
    try {
      _auth.signOut();
      return "signed-out";
    } on Exception catch (e) {
      print(e);
    }
  }
}
