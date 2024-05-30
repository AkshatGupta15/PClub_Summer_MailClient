import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Screens/Home_screen/home_screen.dart';
import 'package:pclub_summer_mailclient/Screens/settings_screen/setting_screen.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical : kPadding!),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 8),
                child: Text(
                  "Mail",
                  style: TextStyle(fontSize: kPadding! - 2),
                ),
              ),
              SizedBox(
                height: kPadding! - 15,
              ),
              const Divider(
                height: 2,
                color: Colors.black54,
              ),
              SizedBox(
                height: kPadding! - 15,
              ),
               DrawerItemWidget(
                title: "All Inbox", 
                icon: Icons.mail, 
                screen: HomeScreen(),
                ),
              SizedBox(
                height: kPadding! - 15,
              ),
              // const Divider(
              //   height: 2,
              //   color: Colors.black54,
              // ),
              SizedBox(
                height: kPadding! - 15,
              ),
               DrawerItemWidget(
                title: "Setting", 
                icon: Icons.settings, screen: SettingScreen(), ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.screen});
  final IconData icon;
  final String title;
  final Widget screen;

  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPadding! -10, vertical: 0),
      margin: EdgeInsets.only(right:  kPadding!),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
        color: const Color.fromARGB(255, 229, 126, 255).withOpacity(.2),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
          ),
          SizedBox(
            width: kPadding!,
          ),
          TextButton(
            child: Text(title),
            // title,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return screen;
                }));
            },
            // style: ButtonStyle(
            //   // textStyle: W
            // )
             )
        ],
      ),
    );
  }
}
