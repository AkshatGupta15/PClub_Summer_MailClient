import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/getMails/mail.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({super.key});
  final List<String> menuTabItems = [
    'Schedule send',
    "Confidential Mode",
    "Discard",
    "Settings",
    "help and feedback"
  ];
  @override
  Widget build(BuildContext context) {
    var toEmail = TextEditingController();
    var subject = TextEditingController();
    var body = TextEditingController();

    void _sendMail(BuildContext context, TextEditingController toEmail, TextEditingController subject, TextEditingController body) async {
  print("Email ${toEmail.text}, Body ${body.text} Subject ${subject.text}");
  bool result = await sendMail(to: toEmail.text, subject: subject.text, body: body.text);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(result ? "Sent Mail" : "Failed to Send Mail"),
        content: Text(result ? "Email sent successfully!" : "There was an error sending the email."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );

  toEmail.clear();
  body.clear();
  subject.clear();
}
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 225, 246),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 24,
            color: Colors.black54,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Compose',
            style: TextStyle(color: Colors.black54),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.attachment_outlined),
              iconSize: 24,
              color: Colors.black54,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              iconSize: 24,
              color: Colors.black54,
              onPressed: () {
                _sendMail(context,toEmail,subject,body);
              },
            ),
            InkWell(
              child: PopupMenuButton(
                iconSize: 24,
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.black54,
                ),
                itemBuilder: (context) => menuTabItems
                    .map(
                      (itemName) => PopupMenuItem(
                        value: itemName,
                        child: Text(itemName),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding!),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding!- 7,
                        left: kPadding!- 10,
                        right: kPadding!- 10),
                    child: const Text(
                      'From',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  hintText: 'akshat23@iitk.ac.in',
                  suffixIcon: IconButton(
                    icon:const Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                controller: toEmail,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: kPadding!- 4),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: kPadding!- 7,
                        left: kPadding!- 10,
                        right: kPadding!- 10),
                    child:const Text(
                      'To',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon:const Icon(Icons.expand_more),
                    color: Colors.black54,
                    onPressed: () {},
                  ),
                ),
              ),
              TextField(
                controller: subject,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding!- 10,
                      left: kPadding!- 10,
                      right: kPadding! - 10,
                      bottom: kPadding! - 10),
                  hintText: 'Subject',
                ),
              ),
              TextField(
                controller: body,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: kPadding! - 10,
                      left: kPadding! - 10,
                      right: kPadding! - 10),
                  hintText: 'Compose',
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ));
  }
}
