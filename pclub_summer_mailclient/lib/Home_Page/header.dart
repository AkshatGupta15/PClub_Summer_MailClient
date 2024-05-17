import 'package:flutter/material.dart';

import 'package:pclub_summer_mailclient/model/data.dart';


class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 8),
      decoration:  BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            blurRadius: 5,
            color:  Colors.black26,
            offset:  Offset(2,0),
        )
      ]),
      child: Row(
        children: [
          SizedBox(
              width: kPadding! - 15,
            ),
          IconButton(
            onPressed: (){
              print("Clicked");
              // HomeScreen().openDrawerHome();
              // HomeScreen().scaffoldKey.currentState?.openDrawer();
            }
            ,
            icon: const Icon(
              Icons.menu,
              size: 24,
              color: Colors.black45,
          )),
          const Expanded(
            flex: 1,
            child:  Padding(
              padding:  EdgeInsets.all(8.0),
              child:  TextField(
                decoration: InputDecoration(
                  hintText: "Search here...",
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/images/logo.png')
              ),
          ),
          SizedBox(
              width: kPadding! - 10,
            ),
        ],
      ),
    );
  }
}
