import 'package:flutter/material.dart';

class CustomCardWithHeader extends StatelessWidget {
  final String header;
  final String? title;
  final String? subtitle;

  const CustomCardWithHeader({
    super.key,
    required this.header,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  header,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'ING_Me',
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(width: 16.0),
            if (title != null && title!.isNotEmpty) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'ING_Me',
                        color: Color.fromRGBO(51, 51, 51, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
