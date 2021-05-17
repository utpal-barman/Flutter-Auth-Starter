part of 'auth_listener_cubit.dart';

abstract class AuthListenerState extends Equatable {
  const AuthListenerState();

  @override
  List<Object> get props => [];
}

class AuthListenerLoading extends AuthListenerState {
  const AuthListenerLoading();
}

class AuthListenerLoadedWithUser extends AuthListenerState {
  final String email;
  const AuthListenerLoadedWithUser(this.email);
}

class AuthListenerLoadedWithNoUser extends AuthListenerState {
  const AuthListenerLoadedWithNoUser();
}
