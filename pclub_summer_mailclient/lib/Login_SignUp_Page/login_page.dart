import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Login_SignUp_Page/components.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'assets/images/loog.png';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        // elevation: 0,
        // title: const Text("IITK MailClinet"),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/bg2.png"),
          //   fit: BoxFit
          //       .cover, // adjust this based on your image size and preference
          // ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(8), // Border width
                  child: logo
                ),
                const SizedBox(
                  height: 20,
                ),
                username,
                const SizedBox(
                  height: 20,
                ),
                password,
                const SizedBox(
                  height: 20,
                ),
                const LoginButton(routeName: "SignUp"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an account?"),
                    TextButton(
                        onPressed: () {
                          // print("CLicked");
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              color: Color.fromARGB(255, 36, 13, 242)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
