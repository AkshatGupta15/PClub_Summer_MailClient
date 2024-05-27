// import 'package:enough_mail/enough_mail.dart';
// import 'package:flutter/material.dart';
// import 'package:pclub_summer_mailclient/components/compose_button/compose_button.dart';
// import 'package:pclub_summer_mailclient/Screens/MailScreen/mail_screen.dart';
// import 'package:pclub_summer_mailclient/components/Drawer/Drawer.dart';
// import 'package:pclub_summer_mailclient/components/header/header.dart';
// import 'package:pclub_summer_mailclient/components/mailItem/mail_item.dart';
// import 'package:pclub_summer_mailclient/getMails/mail.dart';
// import 'package:pclub_summer_mailclient/model/data.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   List<MimeMessage> fetchMailList = [];
//   Future<void> _mails() async {
//     print('\n PRINTING MESSAGES \n');
//     fetchMailList =await FetchMail();
//     for (final message in fetchMailList) {
//       print("\n \n MESSAGE \n \n");
//       // print(message);
//       printMessage(message);
//   }
//   }
//   // _mails();

//   void openDrawerHome() {
//     print("CLicked from home");
//     _scaffoldKey.currentState?.openDrawer();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     // mailList = fetchMailList;
//     mySize = MediaQuery.of(context).size.height;
//     _mails();
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer:  const DrawerApp(),
//       body: GestureDetector(
//         onTap: () {
//           // FocusScope.of(context).requestFocus(FocusNode());
//         },
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
              
//                HeaderBar(
//             onMenuPressed: openDrawerHome,
//           ),
//               SizedBox(
//                 height: kPadding! - 10,
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   "PRIMARY MAILS",
//                   style: TextStyle(
//                     // fontSize: 16,
//                     color: Colors.black54,
//                     wordSpacing: 3,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: kPadding! - 10,
//               ),
//               Expanded(
//                 flex: 1,
//                 child: ListView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: fetchMailList.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) {
//                             return MailDetailScreen(
//                               heading: mailList[index].description,
//                               mail: mailList[index].title,
//                               time: mailList[index].time,
//                             );
//                           },
//                         ));
//                       },
//                         child: MailItemWidget(
//                             title: mailList[index].title,
//                             description: mailList[index].description,
//                             content: mailList[index].content,
//                             time: mailList[index].time,
//                             isRead: mailList[index].isRead),
//                       );
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: ComposeButton()
//     );
//   }
// }


import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/components/compose_button/compose_button.dart';
import 'package:pclub_summer_mailclient/Screens/MailScreen/mail_screen.dart';
import 'package:pclub_summer_mailclient/components/Drawer/Drawer.dart';
import 'package:pclub_summer_mailclient/components/header/header.dart';
import 'package:pclub_summer_mailclient/components/mailItem/mail_item.dart';
import 'package:pclub_summer_mailclient/getMails/mail.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<MimeMessage> fetchMailList = [];

  @override
  void initState() {
    super.initState();
    _mails();
  }

  Future<void> _mails() async {
    print('\n PRINTING MESSAGES \n');
    List<MimeMessage> mailList = await FetchMail();
    setState(() {
      fetchMailList = mailList;
    });
    for (final message in fetchMailList) {
      print("\n \n MESSAGE \n \n");
      printMessage(message);
    }
  }

  void openDrawerHome() {
    print("Clicked from home");
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    mySize = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerApp(),
      body: GestureDetector(
        onTap: () {
          // FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBar(
                onMenuPressed: openDrawerHome,
              ),
              SizedBox(
                height: kPadding! - 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "PRIMARY MAILS",
                  style: TextStyle(
                    color: Colors.black54,
                    wordSpacing: 3,
                  ),
                ),
              ),
              SizedBox(
                height: kPadding! - 10,
              ),
              // Expanded(
              //   flex: 1,
              //   child: ListView.builder(
              //     physics: const BouncingScrollPhysics(),
              //     itemCount: fetchMailList.length,
              //     itemBuilder: (context, index) {
              //       final mail = fetchMailList[index];
              //       return InkWell(
              //         onTap: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) {
              //               return MailDetailScreen(
              //                 heading: mail.decodeSubject()!,
              //                 mail: mail.decodeSubject()!,
              //                 time: mail.decodeSubject()!,
              //               );
              //             },
              //           ));
              //         },
              //         child: MailItemWidget(
              //           title: mail.decodeSubject()!,
              //           description: mail.decodeSubject()!,
              //           content:mail.decodeSubject()!, // Assuming `content` is the text body
              //           time: mail.decodeSubject()!, // Assuming this method exists
              //           isRead: mail.isSeen,
              //         ),
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
