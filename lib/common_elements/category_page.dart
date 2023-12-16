// // ignore_for_file: library_private_types_in_public_api, deprecated_member_use

// import 'package:edeft/ui_screens/admin/admin_login_page.dart';
// import 'package:edeft/ui_screens/student/student_login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class CategoryPage extends StatefulWidget {
//   const CategoryPage({Key? key}) : super(key: key);

//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {

//   @override
//   Widget build(BuildContext context) {

//     var size = MediaQuery.of(context).size;

//     return WillPopScope(
//       onWillPop: () async {
//         // Exit the app when back button is pressed on the Home screen
//         await SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: size.height/8,),
//             Center(child: Text("Select your account type.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height/28),)),
//             SizedBox(height: size.height/20,),
//             Center(
//               child:
//               Container(alignment: AlignmentDirectional.center,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF7DD1F4),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                 ),
//                 width: size.width/1.3,
//                 height: size.height/4,
//                 child:
//                 Wrap(spacing: size.width/20,
//                   children: [
//                     InkWell(
//                       onTap: () {

//                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminLoginPage()));

//                       },
//                       child: Container(
//                         alignment: AlignmentDirectional.center,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(12.0),
//                           ),
//                         ),
//                         width: size.width/4,
//                         height: size.height/7,
//                         child: Wrap(
//                           direction: Axis.vertical,
//                           crossAxisAlignment: WrapCrossAlignment.center,
//                           children: [
//                             Icon(Icons.admin_panel_settings,
//                               color: const Color(0xFF00B2FF),
//                               size: size.height/10,),
//                             Text('Admin',
//                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height/50),),
//                           ],
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {

//                         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StudentLoginPage()));

//                       },
//                       child: Container(
//                         alignment: AlignmentDirectional.center,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(12.0),
//                           ),
//                         ),
//                         width: size.width/4,
//                         height: size.height/7,
//                         child: Wrap(
//                           direction: Axis.vertical,
//                           crossAxisAlignment: WrapCrossAlignment.center,
//                           children: [
//                             Icon(Icons.school,
//                               color: const Color(0xFF00B2FF),
//                               size: size.height/10,),
//                             Text('Student',
//                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height/50),)
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),

//       ),
//     );
//   }
// }
