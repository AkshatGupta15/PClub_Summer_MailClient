import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pclub_summer_mailclient/Screens/compose/components.dart';
import 'package:pclub_summer_mailclient/utils/mail.dart';

class ComposeScreen extends StatelessWidget {
  ComposeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var toEmail = TextEditingController();
    var subject = TextEditingController();
    var body = TextEditingController();
    Future<String> _getEmail() async{
      final storage = FlutterSecureStorage();
      String? email = await storage.read(key: 'email');
      return email!;
    }
    _getEmail();
    
    void _sendMail(BuildContext context, TextEditingController toEmail, TextEditingController subject, TextEditingController body) async {
  print("Email ${toEmail.text}, Body ${body.text} Subject ${subject.text}");
  bool result = await sendMail(to: toEmail.text, subject: subject.text, body: body.text);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(result: result);
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
              composeSelectTextField(text: "From",isEnabled: false,),
              composeSelectTextField(text: "To",isEnabled: true,),
              composeTextField(body: body, text: "Subject",),
              Divider(),
              composeTextField(body: body, text: "Compose",),
            ],
          ),
        ));
  }
}

