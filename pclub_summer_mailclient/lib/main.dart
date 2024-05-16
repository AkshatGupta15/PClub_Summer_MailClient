import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Login_SignUp_Page/login_page.dart';
import 'package:pclub_summer_mailclient/Login_SignUp_Page/signup_page.dart';
// import 'package:flutter_application_1/material_homepage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
Widget build(BuildContext context) {
  return MaterialApp(
    theme: ThemeData(primarySwatch: Colors.cyan),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const LoginPage(),
      '/login': (context) => const LoginPage(),
      '/signup' : (context) => const SignupPage(),
    },
  );
}
}
