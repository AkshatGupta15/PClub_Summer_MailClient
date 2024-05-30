import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Screens/Home_screen/home_screen.dart';
import 'package:pclub_summer_mailclient/Screens/Login_SignUp_Page/login_page.dart';
import 'package:pclub_summer_mailclient/getMails/mail.dart';
// import 'package:pclub_summer_mailclient/Screens/Login_SignUp_Page/signup_page.dart';
// import 'package:pclub_summer_mailclient/getMails/mail.dart';
// import 'package:pclub_summer_mailclient/getMails/_TryFetching.dart';
// import 'package:pclub_summer_mailclient/getMails/mail.dart';
// import 'package:pclub_summer_mailclient/getMails/mail.dart';

// import 'package:flutter_application_1/material_homepage.dart';

void main() {
  runApp(const MyApp());
  // FetchMail();
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
      // '/': (context) =>  HomeScreen(),
      "/home" : (context) =>  HomeScreen(),
      '/login': (context) => const LoginPage(),
      // '/signup' : (context) => const SignupPage(),
    },
  );
}
}
