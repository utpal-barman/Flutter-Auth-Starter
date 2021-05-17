part of 'sign_in_button_cubit.dart';

abstract class SignInButtonState extends Equatable {
  const SignInButtonState();

  @override
  List<Object> get props => [];
}

class SignInButtonInitial extends SignInButtonState {
  const SignInButtonInitial();
}

class SignInButtonLoading extends SignInButtonState {
  const SignInButtonLoading();
}

class SignInButtonError extends SignInButtonState {
  final String errorMessage;
  const SignInButtonError(this.errorMessage);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SignInButtonError && o.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
