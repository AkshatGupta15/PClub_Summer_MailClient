import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pclub_summer_mailclient/Screens/RandomScreens.dart';
import 'package:pclub_summer_mailclient/model/data.dart';
// import "assets/images/user.png";
// import '/Users/akshat/PClub_Summer_MailClient/pclub_summer_mailclient/assets/images/user.png';
class _settingItem {
  final String title,desc;
  final Widget Screen;
     _settingItem({
      required this.title,
      required this.desc,
      required this.Screen
    });
}
class SettingScreen extends StatelessWidget{
  SettingScreen();
  
  // final List<_settingItem> _settingMenuItems = [
  //   _settingItem(title: "General", desc: "Language And Input Setting", Screen: Randomscreens(title: "General",)),
  //   // _settingItem(title: , desc: desc, Screen: Screen)
  //   _settingItem(title: "General", desc: "Language And Input Setting", Screen: Randomscreens(title: "General",)),

  // ];
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
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w600
          ),),
          
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                children: [
                  SizedBox(
                    width: kPadding!*2 - 10,
                  ),
                  Image.asset('assets/images/user.png',
                  height: 100,
                  width: 100,),
                  SizedBox(
                    width: kPadding,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UserName',
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w600,
                          fontSize: 26,
                      ),),
                      Text('akshat@dev.com',
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.grey
                      ),)
                    ],
                  )
                ],
              ),
            SizedBox(
              height: kPadding!,
            ),
            SettingMenuItem(),

            SizedBox(
              height: kPadding! - 15,
            ),

            // ListView.builder(
            //   itemCount: mailList.length,
            //         itemBuilder: (context, index) {
            //           return InkWell(
            //             onTap: () {
            //             Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) {
            //                 return Randomscreens(title: t)
            //               },
            //             ));
            //           },
            //             child: MailItemWidget(
            //                 title: mailList[index].title,
            //                 description: mailList[index].description,
            //                 content: mailList[index].content,
            //                 time: mailList[index].time,
            //                 isRead: mailList[index].isRead),
            //           );
            //         }),
            SizedBox(
              height: kPadding!,
            )
          ],),
      ),
    );
  }
}

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
            offset:Offset(0, 2),
          )
        ]
      ),
      child: Row(
        children: [
          SizedBox(
            width: kPadding! - 15,
          ),
          Icon(
            Icons.settings,
            size: 29,
          ),
          SizedBox(
            width: kPadding! -15 ,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("General",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),),
                Text('Language and Input Setting',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),)
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined),
          SizedBox(
            width: kPadding! - 18,
          ),
        ],
      ),
    );
  }
}

// /Users/akshat/PClub_Summer_MailClient/pclub_summer_mailclient/assets/images/user.png