import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

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
      // margin: EdgeInsets.symmetric(horizontal: 8, vertical: kPadding! - 20),
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
                // Text(
                //   content,
                //   style: TextStyle(
                //     fontSize: 13,
                //     fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
