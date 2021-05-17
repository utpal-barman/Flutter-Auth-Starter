import '../screens/authentication/complete-profile/complete-profile-screen.dart';
import '../screens/authentication/reset-password/reset-password.dart';
import '../screens/authentication/sign-in/sign-in-screen.dart';
import '../screens/authentication/sign-up/sign-up-screen.dart';
import '../screens/home/HomeScreenWrapper.dart';

var kRoutes = {
  '/sign-in': (context) => SignInScreen(),
  '/sign-up': (context) => SignUpScreen(),
  '/reset-password': (context) => ResetPasswordScreen(),
  '/complete-profile': (context) => CompleteProfileScreen(),
  '/home': (context) => HomeScreen(),
};
