import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {


  checkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(const Duration(seconds: 4), () async {
      await prefs.setBool('isWelcomeVisited', true);
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  void initState() {
    super.initState();
    checkPrefs();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25, bottom: 20, left: 10, right: 10),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: FlutterLogo(
                size: 190,
                style: FlutterLogoStyle.horizontal,
              ),
            ),
            Expanded(
              child: Text(
                "Welcome Back ❤️",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}