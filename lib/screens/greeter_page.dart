import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instoreapp/models/constants/asset_path.dart';
import 'package:instoreapp/screens/login_page.dart';

// @deprecated
class GreeterPage extends StatefulWidget {
  const GreeterPage({super.key});

  @override
  State<GreeterPage> createState() => _GreeterPageState();
}

class _GreeterPageState extends State<GreeterPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              LOGO_PATH,
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
