import 'package:flutter/material.dart';

class LoginContiniueButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;

  const LoginContiniueButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              const WidgetStatePropertyAll(Color.fromRGBO(255, 98, 0, 10)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
