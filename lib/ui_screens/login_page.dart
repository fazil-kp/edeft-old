// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edeft/common_elements/button.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/common_elements/text_input_felid.dart';
import 'package:edeft/const/color.dart';
import 'package:edeft/ui_screens/admin/admin_home_page.dart';
import 'package:edeft/ui_screens/student/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CombinedLoginPage extends StatefulWidget {
  const CombinedLoginPage({Key? key}) : super(key: key);

  @override
  State<CombinedLoginPage> createState() => _CombinedLoginPageState();
}

class _CombinedLoginPageState extends State<CombinedLoginPage> {
  final _formKey = GlobalKey<FormState>();
















  String _userName = '';
  String _password = '';

  String errorMsg = '';

  bool passEnable = true;

  void _trySubmitForm() async {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      bool isAdmin = await validateUser('admin');
      bool isStudent = await validateUser('student');

      if (isAdmin) {
        await saveUserCredentials('admin');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdminHomePage()),
        );
      } else if (isStudent) {
        await saveUserCredentials('student');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const StudentHomePage()),
        );
      } else {
        // Show the appropriate error message
        errorMsg = 'Invalid Username or Password!';
        setState(() {});
      }
    }
  }

  Future<void> saveUserCredentials(String userType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
    prefs.setString('user', userType);
    prefs.setString('userName', _userName);
    prefs.setString('password', _password);
  }

  Future<bool> validateUser(String userType) async {
    bool isLogin = false;

    CollectionReference users = FirebaseFirestore.instance.collection('EMEA');

    if (userType == 'student') {
      users = users.doc('student').collection(_userName);
    }

    QuerySnapshot querySnapshot = await users.where('USERNAME', isEqualTo: _userName).get();

    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
      String dbPassword = userData['PASSWORD'];

      if (dbPassword == _password) {
        isLogin = true;
      } else {
        errorMsg = 'Invalid Password!';
        setState(() {});
      }
    } else {
      errorMsg = 'Invalid User!';
      setState(() {});
    }

    return isLogin;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        // Exit the app when the back button is pressed on the Login screen
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        color: const Color(0xFF00B2FF),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: size.height / 2.5,
                      child: Image.asset('assets/images/logo.png'),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login to Edeft',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 30 : 35, fontWeight: FontWeight.bold, color: UiColor.extraDarkGreyColor),
                        ),
                        const SizedBox(height: 10),
                        Text(" Please login to your account", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: UiColor.extraDarkGreyColor, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 360,
                  child: Column(
                    children: [
                      CustomTextInput(
                        prefixWidget: Icon(
                          Icons.person,
                          color: UiColor.blueColor,
                        ),
                        labelText: "Username",
                        borderRadius: 12,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Username must be at least 8 characters in length';
                          }
                          return null;
                        },
                        onChanged: (value) => _userName = value,
                      ),
                      SizedBox(height: ResponsiveHelpers.isMobile(context) ? 20 : 7),
                      CustomTextInput(
                        prefixWidget: Icon(
                          Icons.lock,
                          color: UiColor.blueColor,
                        ),
                        isPassword: passEnable, // Use passEnable here
                        obscureText: true,
                        suffixWidget: IconButton(
                          onPressed: () {
                            setState(() {
                              passEnable = !passEnable;
                            });
                          },
                          icon: Icon(passEnable ? Icons.visibility_off : Icons.visibility),
                        ),
                        labelText: "Password",
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'This field is required';
                          }
                          if (value.trim().length < 8) {
                            return 'Password must be at least 8 characters in length';
                          }
                          return null;
                        },
                        borderRadius: 2,
                        onChanged: (value) => _password = value,
                      ),
                      const SizedBox(height: 25),
                      Button(
                        borderRadius: 13,
                        title: "Login",
                        textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                        onPressed: _trySubmitForm,
                        width: double.infinity,
                        buttonType: ButtonType.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ResponsiveHelpers.isMobile(context) ? 25 : 12),
                Text("By continuing, you agree to Edeft's Terms of Service and Privacy Policy", style: Theme.of(context).textTheme.labelMedium!.copyWith(color: UiColor.extraDarkGreyColor, fontSize: 9.5), textAlign: TextAlign.center),
                SizedBox(
                  height: size.height / 30,
                ),
                Text(
                  errorMsg,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 10;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 30 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// The CustomTextInput widget remains the same
