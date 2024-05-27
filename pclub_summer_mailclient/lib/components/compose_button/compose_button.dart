import 'package:flutter/material.dart';
import 'package:pclub_summer_mailclient/Screens/compose/compose_screen.dart';
import 'package:pclub_summer_mailclient/model/data.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ComposeScreen()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: kPadding! - 10, vertical: kPadding! - 15),
            // horizontal: 20, vertical: 25),
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
    );
  }
}
