// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';
import 'package:edeft/ui_screens/admin/admin_home_page.dart';
import 'package:edeft/ui_screens/login_page.dart';
import 'package:edeft/ui_screens/student/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        checkLoginState();
      },
    );
  }

  Future<void> checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String user = prefs.getString('user').toString();
    if (isLoggedIn) {
      if (user == 'student') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StudentHomePage()),
        );
      } else if (user == 'admin') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdminHomePage()),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const CombinedLoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B2FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          const Center(
            child: Text(
              'edeft',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
