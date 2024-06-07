
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Screens/MailScreen/components.dart';

class MailDetailScreen extends StatelessWidget {
  // MailDetailScreen({super.key, required this.heading,required this.mail,required this.time});
  MailDetailScreen({super.key, required this.message});
  final MimeMessage message;

  
  @override
  Widget build(BuildContext context) {
    String fromName = message.from![0].toString().split('<')[0];
    int len = fromName.length;
    String fullName = fromName.substring(1,len-2);
    final heading = message.from.toString();
    final mailText = message.decodeTextPlainPart()!.split('\r\n');
    final avatarText = "A";
    return Scaffold(
      appBar: mailScreenAppbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-------------Title Widget
            mailTitleWidget(message: message),

            //-----------Mail Heading Widget
            mailHeadingWidget(avatarText: avatarText, fullName: fullName, menuMailItems: menuMailItems),

            //-----------------------Mail Info/Content
            MailInfo(mailText: mailText),
            //-----------------------Last Three Buttons
            mailScreen3ButtonsRow()
          ],
        ),
      ),
    );
  }

  AppBar mailScreenAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 242, 225, 246),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        iconSize: 24,
        color: Colors.black54,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        appBarIconButton(icon: Icons.archive_outlined,),
        appBarIconButton(icon: Icons.delete,),
        appBarIconButton(icon: Icons.email,),
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
    );
  }
}

