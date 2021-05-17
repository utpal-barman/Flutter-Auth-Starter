import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/auth-services.dart';

part 'sign_in_button_state.dart';

class SignInButtonCubit extends Cubit<SignInButtonState> {
  SignInButtonCubit() : super(SignInButtonInitial());

  signInUser(String email, String password) async {
    emit(SignInButtonLoading());

    if (email.contains("@")) {
      print("signing with Firebase Auth");
      var authResult =
          await AuthServices().signInWithEmailPassword(email, password);
      if (authResult == "ok") {
        emit(SignInButtonInitial());
      } else if (authResult == "No users found") {
        emit(SignInButtonError("No users found"));
      } else if (authResult == "You entered wrong password") {
        emit(SignInButtonError("You entered wrong password"));
      } else {
        emit(SignInButtonError("Something went wrong"));
      }
    } else {
      print("sign in with Django Auth");
    }
  }
}
