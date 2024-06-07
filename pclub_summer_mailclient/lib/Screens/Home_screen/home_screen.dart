import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/components/compose_button/compose_button.dart';
import 'package:pclub_summer_mailclient/Screens/MailScreen/mail_screen.dart';
import 'package:pclub_summer_mailclient/components/Drawer/Drawer.dart';
import 'package:pclub_summer_mailclient/components/header/header.dart';
import 'package:pclub_summer_mailclient/components/mailItem/mail_item.dart';
import 'package:pclub_summer_mailclient/utils/mail.dart';
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
    List<MimeMessage> mailList = await FetchMail();
    setState(() {
      fetchMailList = mailList;
    });
    // for (final message in fetchMailList) {
    //   print("\n \n MESSAGE \n \n");
    //   printMessage(message);
    // }
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

              Expanded(
                flex: 1,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: fetchMailList.length,
                  itemBuilder: (context, index) {
                    final mail = fetchMailList[index];
                    final plainText = mail.decodeTextPlainPart();
final description = plainText != null && plainText.isNotEmpty
    ? plainText.split('\r\n').firstWhere((line) => line.isNotEmpty, orElse: () => "Not Found")
    : "Not Found";
                    String fromName = mail.from![0].toString().split('<')[0];
                    int len = fromName.length;
                    String fullName = fromName.substring(1,len-2);
                    final time = mail
                        .decodeDate()
                        .toString()
                        .split(" ")[1]
                        .substring(0, 5);
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return MailDetailScreen(
                              message: mail,
                            );
                          },
                        ));
                      },
                      child: MailItemWidget(
                        title: fullName,
                        description: mail.decodeSubject()!,
                        time: time,
                        isRead: mail.isSeen,
                      ),
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
