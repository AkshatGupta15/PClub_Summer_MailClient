import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pclub_summer_mailclient/Screens/Login_SignUp_Page/components.dart';
import 'package:pclub_summer_mailclient/utils/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _email = TextEditingController();
    var _password = TextEditingController();

    Future<void> _login() async {

      final storage = FlutterSecureStorage();
        String? username = await storage.read(key: 'email');
        String? password = await storage.read(key: 'password');
        bool isAuthenticated;
        print("Username : ${username} password : $password");
        if (_email.text == "" && _password.text == ""){
          print("Local storage");
          isAuthenticated = await Authenticate(
              email: username!,
              password: password!,
                );
        } else {

          print("text controllers");
                isAuthenticated = await Authenticate(
              email: _email.text,
              password: _password.text,
                );
          
        }
        


      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, "/home");
        if (_email.text != "" && _password.text != ""){
            await storage.write(key: 'email', value: _email.text);
        await storage.write(key: 'password', value: _password.text);
        
        }
        
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
        backgroundColor: Colors.transparent, 
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
              Container(
                  padding: const EdgeInsets.all(8), // Border width
                  child: logo),
              const SizedBox(
                height: 20,
              ),
              loginUserTextField(email: _email),
              const SizedBox(
                height: 20,
              ),
              loginPasswordTextField(password: _password),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  child: Text(
                    "Login",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

