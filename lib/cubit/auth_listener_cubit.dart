import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_listener_state.dart';

class AuthListenerCubit extends Cubit<AuthListenerState> {
  AuthListenerCubit() : super(AuthListenerLoading());

  authLoadedWithUser(email) {
    emit(AuthListenerLoadedWithUser(email));
  }

  authLoadedWithNoUser() {
    emit(AuthListenerLoadedWithNoUser());
  }
}
