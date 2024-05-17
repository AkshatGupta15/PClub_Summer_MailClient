import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/ComposeScreen/compose_screen.dart';
import 'package:pclub_summer_mailclient/Home_Page/header.dart';
import 'package:pclub_summer_mailclient/MailScreen/mail_screen.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawerHome() {
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
              ElevatedButton(
                child: const Text("D"),
                onPressed: () {
                  // print("Clicked");
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              const Header(),
              SizedBox(
                height: kPadding! - 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "PRIMARY MAILS",
                  style: TextStyle(
                    // fontSize: 16,
                    color: Colors.black54,
                    wordSpacing: 3,
                  ),
                ),
              ),
              SizedBox(
                height: kPadding! - 10,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mailList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MailDetailScreen(
                              heading: mailList[index].description,
                              mail: mailList[index].title,
                              time: mailList[index].time,
                            );
                          },
                        ));
                      },
                        child: MailItemWidget(
                            title: mailList[index].title,
                            description: mailList[index].description,
                            content: mailList[index].content,
                            time: mailList[index].time,
                            isRead: mailList[index].isRead),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ComposeScreen()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kPadding! - 10, vertical: kPadding! - 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ],
            color: const Color.fromARGB(255, 229, 126, 255),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              SizedBox(
                width: kPadding! - 20,
              ),
              const Text(
                "Compose",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
              const DrawerItemWidget(
                title: "All Inbox", 
                icon: Icons.mail, index: 2,),
              SizedBox(
                height: kPadding! - 15,
              ),
              const Divider(
                height: 2,
                color: Colors.black54,
              ),
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
      required this.index});
  final IconData icon;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kPadding!, vertical: kPadding!-10),
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
          Text(title, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}

class MailItemWidget extends StatelessWidget {
  const MailItemWidget({
    required this.title,
    required this.description,
    required this.content,
    required this.time,
    required this.isRead,
    super.key,
  });
  final String title, content, description, time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: kPadding! - 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black26,
              offset: Offset(2, 0),
            )
          ]),
      child: Expanded(
        flex: 1,
        child: Row(
          children: [
            CircleAvatar(
              child: Text(title.substring(0, 1)),
            ),
            SizedBox(
              width: kPadding! - 12,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight:
                                isRead ? FontWeight.w400 : FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight:
                              isRead ? FontWeight.w400 : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
