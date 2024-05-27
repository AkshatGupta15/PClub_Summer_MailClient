import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pclub_summer_mailclient/Screens/Login_SignUp_Page/components.dart';
import 'package:pclub_summer_mailclient/getMails/mail.dart';

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
    // final storage = FlutterSecureStorage();
    var _email = TextEditingController();
    var _password = TextEditingController();
    //   void _EmailValidator(){

    //     if (_email == ""){

    //     }
    //     bool isValidEmail() {
    //   return RegExp(
    //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    //       .hasMatch(this);
    // }
    //   }

    Future<void> _login() async {
      // bool
      final storage = FlutterSecureStorage();
        String? username = await storage.read(key: 'email');
        // String? password = await storage.read(key: 'password');
        print("Username : ${username}");
      bool isAuthenticated = await Authenticate(
        email: _email.text,
        password: _password.text,
      );

      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, "/home");
        await storage.write(key: 'email', value: _email.text);
        await storage.write(key: 'password', value: _password.text);
        
      } else {
        // Show error message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content:
                  Text('Please check your email and password and try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

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
                    child: logo),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _email,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: const Text("Username..."),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: const Text("Password..."),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // await storage.write(key: 'email', value: _email.text);
                      // await storage.write(key: 'password', value: _password.text);
                      _login();
                    },
                    child: Text(
                      "Login",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Don't Have an account?"),
                //     TextButton(
                //         onPressed: () {
                //           // print("CLicked");
                //         },
                //         child: const Text(
                //           "SignUp",
                //           style: TextStyle(
                //               color: Color.fromARGB(255, 36, 13, 242)),
                //         ))
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
