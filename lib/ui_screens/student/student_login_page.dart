// // ignore_for_file: use_build_context_synchronously

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:edeft/ui_screens/student/student_home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StudentLoginPage extends StatefulWidget {
//   const StudentLoginPage({Key? key}) : super(key: key);

//   @override
//   State<StudentLoginPage> createState() => _StudentLoginPageState();
// }

// class _StudentLoginPageState extends State<StudentLoginPage> {
//   final _formKey = GlobalKey<FormState>();

//   bool passenable = true;

//   String _userName = '';
//   String _password = '';

//   String errorMsg = '';

//   void _trySubmitForm() async {
//     final bool? isValid = _formKey.currentState?.validate();
//     if (isValid == true) {
//       bool isLogin = await validateUser();

//       if (isLogin) {
//         final SharedPreferences pref = await SharedPreferences.getInstance();
//         await pref.setBool('isLoggedIn', true);
//         await pref.setString('user', 'student');
//         await pref.setString('userName', _userName);

//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => const StudentHomePage()),
//         );
//       }
//     }
//   }

//   Future<bool> validateUser() async {
//     bool isLogin = false;

//     CollectionReference users = FirebaseFirestore.instance.collection('EMEA').doc('student').collection(_userName);
//     QuerySnapshot querySnapshot = await users.where('USERNAME', isEqualTo: _userName).get();

//     if (querySnapshot.docs.length == 1) {
//       Map<String, dynamic> userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
//       String dbPassword = userData['PASSWORD'];

//       if (dbPassword == _password) {
//         isLogin = true;
//       } else {
//         errorMsg = 'Invalid Password!';
//         setState(() {});
//       }
//     } else {
//       errorMsg = 'Invalid User!';
//       setState(() {});
//     }

//     return isLogin;
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   ClipPath(
//                     clipper: CustomClipPath(),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 300,
//                       color: const Color(0xFF00B2FF),
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     height: size.height / 2.5,
//                     child: Image.asset('assets/images/logo.png'),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: size.height / 10,
//                 child: const Text(
//                   'Student Portal',
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               SizedBox(
//                 width: size.width / 1.5,
//                 child: TextFormField(
//                   //controller: nameController,
//                   decoration: const InputDecoration(
//                     //border: OutlineInputBorder(),
//                     prefixIcon: Icon(
//                       Icons.person,
//                       color: Color(0xFF00B2FF),
//                     ),
//                     labelText: 'Username',
//                     // errorText:  _validate? 'Value Cant Be Empty',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'This field is required';
//                     }
//                     if (value.trim().length < 4) {
//                       return 'Username must be at least 4 characters in length';
//                     }
//                     // Return null if the entered username is valid
//                     return null;
//                   },
//                   onChanged: (value) => _userName = value,
//                 ),
//               ),
//               SizedBox(
//                 height: size.height / 50,
//               ),
//               SizedBox(
//                 width: size.width / 1.5,
//                 child: TextFormField(
//                   obscureText: passenable,
//                   //controller: passwordController,

//                   decoration: InputDecoration(
//                       //border: OutlineInputBorder(),
//                       prefixIcon: const Icon(
//                         Icons.key_rounded,
//                         color: Color(0xFF00B2FF),
//                       ),
//                       labelText: 'Password',
//                       suffix: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (passenable) {
//                                 passenable = false;
//                               } else {
//                                 passenable = true;
//                               }
//                             });
//                           },
//                           icon: Icon(passenable == true ? Icons.remove_red_eye : Icons.password))),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'This field is required';
//                     }
//                     if (value.trim().length < 8) {
//                       return 'Password must be at least 8 characters in length';
//                     }
//                     // Return null if the entered password is valid
//                     return null;
//                   },
//                   onChanged: (value) => _password = value,
//                 ),
//               ),
//               SizedBox(
//                 height: size.height / 20,
//               ),
//               SizedBox(
//                 width: size.width / 4,
//                 height: size.height / 20,
//                 child: ElevatedButton(
//                   onPressed: _trySubmitForm,
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       backgroundColor: const Color(0xFF00B2FF)),
//                   child: const Text(
//                     'Login',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: size.height / 30,
//               ),
//               Text(
//                 errorMsg,
//                 style: const TextStyle(color: Colors.red, fontSize: 18),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomClipPath extends CustomClipper<Path> {
//   var radius = 10.0;
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height);
//     var curXPos = 0.0;
//     var curYPos = size.height;
//     var increment = size.width / 10;
//     while (curXPos < size.width) {
//       curXPos += increment;
//       curYPos = curYPos == size.height ? size.height - 30 : size.height;
//       path.lineTo(curXPos, curYPos);
//     }
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
