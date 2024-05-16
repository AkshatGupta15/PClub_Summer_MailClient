import 'package:flutter/material.dart';

final logo = ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(100), // Image radius
                      child:
                          Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                    ),
                  );
final username = TextField(
  autofocus: false,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    label: const Text("Username..."),
    contentPadding:const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),

    ),
);

final password = TextField(
  obscureText: true,
  autofocus: false,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    label: const Text("Password..."),
    contentPadding:const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),

    ),);

class LoginButton extends StatelessWidget{
  final String routeName;
  const LoginButton({super.key,required this.routeName});
  // const LoginButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: (){
Navigator.pushReplacementNamed(context, "/${routeName.toLowerCase()}"); 
                }, 
                child:  Text(
                  routeName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  )
              );
    
  }
}
