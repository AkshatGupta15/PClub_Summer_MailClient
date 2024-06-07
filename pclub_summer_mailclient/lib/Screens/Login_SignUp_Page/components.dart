import 'package:flutter/material.dart';

final logo = ClipOval(
  child: SizedBox.fromSize(
    size: const Size.fromRadius(100), // Image radius
    child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
  ),
);
final username = TextField(
  autofocus: false,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    label: const Text("Username..."),
    contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  ),
);

class loginPasswordTextField extends StatelessWidget {
  const loginPasswordTextField({
    super.key,
    required TextEditingController password,
  }) : _password = password;

  final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}

class loginUserTextField extends StatelessWidget {
  const loginUserTextField({
    super.key,
    required TextEditingController email,
  }) : _email = email;

  final TextEditingController _email;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
