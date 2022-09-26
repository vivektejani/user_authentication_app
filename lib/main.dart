import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_authentication_app/register_page.dart';
import 'package:user_authentication_app/welcome_page.dart';

import 'home_page.dart';
import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isRegister = prefs.getBool('isRegister') ?? false;
  bool? isLogedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Welcome_page',

      routes: {
        '/': (context) => const HomePage(),
        'Login_page': (context) => const LoginPage(),
        'Register_page': (context) => const RegisterPage(),
        'Welcome_page': (context) => const WelcomePage(),
      },
    ),
  );
}