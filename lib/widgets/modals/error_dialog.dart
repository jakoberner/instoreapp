import 'package:flutter/material.dart';

class ErrorDialog {
  static Future<void> openDialog(
          BuildContext context, String title, String content, String btn) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          title: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          content: Builder(builder: (context) {
            var height =
                content.length < 50 ? double.parse("50") : double.parse("100");

            return Container(
              alignment: Alignment.center,
              height: height,
              width: 270,
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            );
          }),
          actions: [
            const Divider(
              height: 1,
              color: Color.fromRGBO(202, 202, 218, 1),
            ),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Container(
                alignment: Alignment.center,
                child: Text(btn),
              ),
            ),
          ],
        ),
      );
}
