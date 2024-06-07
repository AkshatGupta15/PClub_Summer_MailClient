import 'dart:math';

import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

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
class appBarIconButton extends StatelessWidget {
  const appBarIconButton({
    super.key,
    required this.icon
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:  Icon(icon),
      iconSize: 24,
      color: Colors.black54,
      onPressed: () {},
    );
  }
}

class mailTitleWidget extends StatelessWidget {
  const mailTitleWidget({
    super.key,
    required this.message,
  });

  final MimeMessage message;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 17),
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
    );
  }
}

class mailHeadingWidget extends StatelessWidget {
  const mailHeadingWidget({
    super.key,
    required this.avatarText,
    required this.fullName,
    required this.menuMailItems,
  });

  final String avatarText;
  final String fullName;
  final List<String> menuMailItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    Expanded(
                      child: Text(
                        fullName,
                        style: const TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'to me',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Icon(
                      Icons.expand_more,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.keyboard_return),
            onPressed: () {},
          ),
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
    );
  }
}

class mailScreen3ButtonsRow extends StatelessWidget {
  const mailScreen3ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class MailInfo extends StatelessWidget {
  const MailInfo({
    super.key,
    required this.mailText,
  });

  final List<String> mailText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding!),
      child: Text(
        mailText.where((line) => !line.startsWith('>')).join('\n'),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}
