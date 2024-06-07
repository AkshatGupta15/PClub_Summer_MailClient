
import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/model/data.dart';



final List<String> menuTabItems = [
    'Schedule send',
    "Discard",
    "Settings",
    "help and feedback"
  ];

class composeSelectTextField extends StatelessWidget {
  const composeSelectTextField({
    super.key,
    this.isEnabled,
    required this.text
  });
  final bool? isEnabled;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isEnabled,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: kPadding!),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
              top: kPadding!- 7,
              left: kPadding!- 10,
              right: kPadding!- 10),
          child: Text(
            text,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
        ),
        hintText: !isEnabled! ? 'akshat23@iitk.ac.in' : "",
        suffixIcon: IconButton(
          icon:const Icon(Icons.expand_more),
          color: Colors.black54,
          onPressed: () {},
        ),
      ),
    );
  }
}

class composeTextField extends StatelessWidget {
  const composeTextField({
    super.key,
    required this.body,
    required this.text
  });

  final TextEditingController body;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextField(
        controller: body,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: kPadding! - 10,
              left: kPadding! - 10,
              right: kPadding! - 10),
          hintText: text,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.result,
  });

  final bool result;

  @override
  Widget build(BuildContext context) {
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
  }
}

