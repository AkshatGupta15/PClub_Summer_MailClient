import 'dart:math';

import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/model/data.dart';


class MailDetailScreen extends StatelessWidget {
  // MailDetailScreen({super.key, required this.heading,required this.mail,required this.time});
  MailDetailScreen({super.key, required this.message});
  final MimeMessage message;
  
  final List<String> menuTabItems = [
    "Move to",
    "Snooze",
    "Mark as important",
    "Mute",
    "Print",
    "Report spam",
    "Help and feedback"
  ];
  final List<String> menuMailItems = [
    "Reply all",
    "Forward",
    "Add star",
    "Print",
    "Mark unread from here",
    "Block GitHub",
  ];
  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'"([^"]+)"');
    String? fullName = regex.firstMatch(message.from.toString())?.group(1);
    final heading = message.from.toString();
    final  mailText = message.decodeTextPlainPart()!.split('\r\n');
    // final String mailText =
    // final avatarText = mail.substring(0, 1);
    final avatarText = "A";
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
        actions: [
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            iconSize: 24,
            color: Colors.black54,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            iconSize: 24,
            color: Colors.black54,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.email),
            iconSize: 24,
            color: Colors.black54,
            onPressed: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-------------Title Widget
            Padding(
              padding: EdgeInsets.all(kPadding!),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: mySize - 10,
                      child: Text(
                        message.decodeSubject()!,
                        style: TextStyle(
                            color: Colors.black87.withOpacity(0.8), fontSize: 17),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.star_border),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
        
            //-----------Mail Heading Widget
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding!),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text(avatarText),
                  ),
                  SizedBox(width: kPadding! - 12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              fullName!,
                              style: const TextStyle(fontSize: 15),
                            ),
                            // Text(
                            //   time,
                            //   style: const TextStyle(fontSize: 13),
                            // ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text(
                              'to me',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.keyboard_return), onPressed: () {}),
                  InkWell(
                    child: PopupMenuButton(
                      iconSize: 24,
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.black54,
                      ),
                      itemBuilder: (context) => menuMailItems
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
            ),
            //-----------------------Mail Info/Content
            Padding(
              padding: EdgeInsets.all(kPadding!),
              child: Text(
          mailText.where((line) => !line.startsWith('>')).join('\n'),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
            ),
            //-----------------------Last Three Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.06),
                    // primary: Colors.black54,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.reply),
                  label: const Text('Reply'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.06),
                    // primary: Colors.black54,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.reply_all),
                  label: const Text('Reply all'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.06),
                    // primary: Colors.black54,
                  ),
                  onPressed: () {},
                  icon: Transform(
                    transform: Matrix4.rotationY(pi),
                    alignment: Alignment.center,
                    child: const Icon(Icons.reply),
                  ),
                  label: const Text('Forward'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}