import 'package:flutter/material.dart';

class CustomCardWithLeftIcon extends StatelessWidget {
  final String leadingPath;
  final String trailingPath;
  final String title;
  final String subtitle;

  const CustomCardWithLeftIcon({
    super.key,
    required this.leadingPath,
    required this.trailingPath,
    required this.title,
    required this.subtitle,
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
              children: [Image.asset(leadingPath, width: 24, height: 24)],
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'ING_Me',
                      color: Color.fromRGBO(51, 51, 51, 1),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'ING_Me',
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(105, 105, 105, 1)),
                ),
              ],
            ),
            Column(children: [
              Image.asset(trailingPath, width: 24, height: 24),
            ])
          ],
        ),
      ),
    );
  }
}

