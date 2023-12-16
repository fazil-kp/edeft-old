// // ignore_for_file: use_build_context_synchronously

// import 'package:edeft/common_elements/category_page.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AlertWindow extends StatelessWidget {
//   const AlertWindow({Key? key, required this.i, required this.alertHead, required this.alertText}) : super(key: key);

//   final int i;
//   final String alertHead;
//   final String alertText;

//   @override

//   Widget build(BuildContext context) {
//     return AlertDialog(
//         title: Text(alertHead, style:const TextStyle(fontWeight:
//         FontWeight.bold,fontSize: 18),),
//         content:  Text(alertText,style: const TextStyle(fontStyle: FontStyle.italic,),),
//         actions: <Widget>[
//           if(i==1)
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Container(
//               color:Colors.redAccent,
//               padding: const EdgeInsets.all(14),
//               child: const Text("Cancel",style: TextStyle(color: Colors.white),),
//             ),
//           ),
//           TextButton(
//             onPressed: () async {
//               final SharedPreferences pref = await SharedPreferences.getInstance();
//               await pref.setBool('isLoggedIn', false);

//               i==0?Navigator.of(context).pop():Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                       const CategoryPage()));
//             },
//             child: Container(
//               color: const Color(0XFF00b2ff),
//               padding: const EdgeInsets.all(14),
//               child:i==0? const Text("okay",style: TextStyle(color: Colors.white),): const Text("Log Out",style: TextStyle(color: Colors.white))
//             ),
//           ),
//         ]);
//   }
// }