import 'package:flutter/material.dart';
//import 'package:medic/assets/features/authentication/screens/vender_auth.dart';
//import 'package:medic/assets/features/authentication/screens/customer_auth.dart';
import 'package:medic/assets/features/authentication/screens/login.dart';
import 'package:medic/assets/features/authentication/services/authentication_service.dart';
import 'package:medic/assets/global_variables.dart';
import 'package:medic/assets/providers/user_provider.dart';
import 'package:medic/rout.dart';
import 'package:provider/provider.dart';
import 'package:medic/assets/common/widgets/bottom_bar.dart';
import 'package:medic/assets/admin/screens/admin_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child:const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  final AuthenticationService authService = AuthenticationService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medishare',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.appbacrcolor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const LoginScreen(),
    );
  }
}
