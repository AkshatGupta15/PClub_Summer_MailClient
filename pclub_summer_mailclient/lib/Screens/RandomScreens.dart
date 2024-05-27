import 'package:flutter/material.dart';

class Randomscreens extends StatelessWidget{
  final String title;
  const Randomscreens({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
      title: Text(title),
    ),
   );
  }
}