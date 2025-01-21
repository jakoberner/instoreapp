import 'package:flutter/material.dart';

class GeneralButton {
  static generalButton(dynamic action, String txt) {
    return ElevatedButton(
      onPressed: action,
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
        txt,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
