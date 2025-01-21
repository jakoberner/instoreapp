import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IngAppBar extends StatelessWidget {
    final Widget? leading;
    final bool automaticallyImplyLeading;
    final String title;
    final List<Widget>? actions;
    Widget? flexibleSpace;
    double? elevation;
    Color? shadowColor;
    Color? backgroundColor;
    Color? foregroundColor;
    ShapeBorder? shape;
    Color? surfaceTintColor;
    double? scrolledUnderElevation;
    bool? centerTitle;
    TextStyle? toolbarTextStyle;
    TextStyle? titleTextStyle;
    IconThemeData? iconTheme;
    IconThemeData? actionsIconTheme;

    IngAppBar({
      super.key,
      this.leading,
      required this.automaticallyImplyLeading,
      required this.title,
      this.actions,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
        leading: leading,
        automaticallyImplyLeading: true,
        title: Text(title), 
        actions: null, 
        flexibleSpace: null, 
        elevation: 1.0, 
        shadowColor: const Color.fromRGBO(224, 224, 224, 1), 
        backgroundColor: Colors.white, 
        foregroundColor: const  Color.fromRGBO(51, 51, 51, 1),
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(200, 200, 200, 1), width: 2.0)
        ), 
        surfaceTintColor: Colors.white, 
        scrolledUnderElevation: 0.0, 
        centerTitle: true, 
        toolbarTextStyle: const TextStyle(color: Colors.red), 
        titleTextStyle: const TextStyle(
            color: Color.fromRGBO(51, 51, 51, 1),
            backgroundColor: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.1,
            fontFamily: 'ING_Me'
            // line-height: 24 yazılmış
          ), 
        iconTheme: null, 
        actionsIconTheme: null
      );
  }
}