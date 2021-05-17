import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/apptheme.dart';
import 'cubit/auth_listener_cubit.dart';
import 'cubit/sign_in_button_cubit.dart';
import 'routes/routes.dart';
import 'screens/home/HomeScreenWrapper.dart';
import 'widgets/FirebaseWrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Hive.initFlutter();
  await Hive.openBox('log');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInButtonCubit()),
        BlocProvider(create: (context) => AuthListenerCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "kAppName",
        theme: appThemeData(),
        home: FirebaseWrapper(
          child: HomeScreenWrapper(),
        ),
        routes: kRoutes,
      ),
    );
  }
}
