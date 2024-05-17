import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Login_SignUp_Page/components.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'assets/images/loog.png';
class SignupPage extends StatefulWidget{
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() =>  _SignUpPageState();
}
class _SignUpPageState extends State<SignupPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text("IITK MailClinet"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              logo,
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
              const LoginButton(routeName: "Login"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already Have an account?"),
                  TextButton(
                      onPressed: () {
                        // print("CLicked");
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(color: Color.fromARGB(255, 36, 13, 242)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
