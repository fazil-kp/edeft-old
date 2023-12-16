// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:edeft/common_elements/alert_box.dart';
import 'package:edeft/const/constant_fonts.dart';
import 'package:edeft/ui_screens/admin/admin_faculties_list_page.dart';
import 'package:edeft/ui_screens/admin/admin_notifications_page.dart';
import 'package:edeft/ui_screens/admin/admin_study_materials_page.dart';
import 'package:edeft/ui_screens/admin/admin_time_table_page.dart';
import 'package:edeft/ui_screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int i = 0;
    return WillPopScope(
      onWillPop: () async {
        // Exit the app when back button is pressed on the Home screen
        await SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        drawer: Drawer(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: size.height / 3, child: const DrawerHeader(decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50)), color: Colors.black12, image: DecorationImage(image: NetworkImage('https://rnaip.com/wp-content/uploads/2022/05/RNA-GREY-LOGO-SHADOW.png'))), child: Text('edeft', style: TextStyle(fontFamily: bold)))),
              ListTile(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomePage())), leading: Icon(Icons.home, color: Colors.black, size: size.height / 24), title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48, fontFamily: bold))),
              // ListTile(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AlertWindow(i: 0, alertHead: 'My Account', alertText: 'Contact at ` mspp.f2a@gmail.com ` for account related queries.\n if you phase any issue with your account, contact at +9874563210.\n\n You will have full control over your account in the future. \n\n\nThank you for using Edeft'))), leading: Icon(Icons.account_box_rounded, color: Colors.black, size: size.height / 24), title: Text('My Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48, fontFamily: bold))),
              // ListTile(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AlertWindow(i: 0, alertHead: "Contact Us", alertText: "Share your feedback at mspp.f2a@gmail.com"))), leading: Icon(Icons.call, color: Colors.black, size: size.height / 24), title: Text('Contact Us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48, fontFamily: bold))),
              if (i == 0)
                ListTile(
                  onTap: () => AlertBox.showAlert(
                    context,
                    title: "Logout? ",
                    message: "Are you sure you want to logout?\nYou can always login again.",
                    fistButtonTitle: "Yes, Logout",
                    secondButtonTitle: "Cancel",
                    onFirstButtonPressed: () async {
                      final SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setBool('isLoggedIn', false);
                      i == 1 ? Navigator.of(context).pop() : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CombinedLoginPage()));
                    },
                  ),
                  leading: Icon(Icons.logout, color: Colors.black, size: size.height / 24),
                  title: Text('Log out', style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48, fontFamily: bold)),
                ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('edeft', style: TextStyle(color: Colors.black, fontFamily: bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            if (i == 0)
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () => AlertBox.showAlert(
                  context,
                  title: "Logout? ",
                  message: "Are you sure you want to logout?\nYou can always login again.",
                  fistButtonTitle: "Yes, Logout",
                  secondButtonTitle: "Cancel",
                  onFirstButtonPressed: () async {
                    final SharedPreferences pref = await SharedPreferences.getInstance();
                    await pref.setBool('isLoggedIn', false);
                    i == 1 ? Navigator.of(context).pop() : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CombinedLoginPage()));
                  },
                ),
              ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menu', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: bold)),
                SizedBox(height: 18),
                //Attendance button
                CustomButtonInHome(navigationInButton: AdminHomePage(), iconInButton: Icons.fact_check_rounded, textInButton: 'Attendance'),
                SizedBox(height: 18),
                //Time table button
                CustomButtonInHome(navigationInButton: AdminTimeTablePage(), iconInButton: Icons.view_list_rounded, textInButton: 'Time Table'),
                SizedBox(height: 18),
                //Faculties Button
                CustomButtonInHome(navigationInButton: AdminFacultiesListPage(), iconInButton: Icons.man_rounded, textInButton: 'Faculties'),
                SizedBox(height: 18),
                //Study Materials Button
                CustomButtonInHome(navigationInButton: AdminStudyMaterialsPage(), iconInButton: Icons.menu_book_rounded, textInButton: 'Study Materials'),
                SizedBox(height: 18),
                //Fees Button
                CustomButtonInHome(navigationInButton: AdminNotificationsPage(), iconInButton: Icons.notifications_active, textInButton: 'Push Notification'),
                SizedBox(height: 18),
                //Fees Button
                CustomButtonInHome(navigationInButton: AdminNotificationsPage(), iconInButton: Icons.payments_rounded, textInButton: 'Fees'),
                // SizedBox(height: 18),
                //Q&A Button
                // CustomButtonInHome(navigationInButton: AlertWindow(i: 0, alertHead: "Coming Soon...!", alertText: "Stay Updated we are launching soon......."), iconInButton: Icons.question_answer_rounded, textInButton: "Q&A"),
                SizedBox(height: 18),
                //Assessment Button
                CustomButtonInHome(navigationInButton: AdminHomePage(), iconInButton: Icons.assessment_rounded, textInButton: 'Assessment'),
                SizedBox(height: 18),
                //Assignment Button
                CustomButtonInHome(navigationInButton: AdminHomePage(), iconInButton: Icons.assignment, textInButton: 'Assignment'),
                SizedBox(height: 18),
                //My Account
                // CustomButtonInHome(navigationInButton: AlertWindow(i: 0, alertHead: 'My Account', alertText: 'Contact at ` mspp.f2a@gmail.com ` for account related queries.\n if you phase any issue with your account, contact at +9874563210.\n\n You will have full control over your account in the future. \n\n\nThank you for using Edeft'), iconInButton: Icons.account_box_rounded, textInButton: 'My Account'),
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonInHome extends StatelessWidget {
  const CustomButtonInHome({super.key, required this.navigationInButton, required this.iconInButton, required this.textInButton});
  final Widget navigationInButton;
  final IconData iconInButton;
  final String textInButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => navigationInButton));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        child: Padding(padding: const EdgeInsets.symmetric(vertical: 15), child: SizedBox(width: double.infinity, child: Wrap(spacing: 12, crossAxisAlignment: WrapCrossAlignment.center, children: [Icon(iconInButton, size: 50, color: Colors.white), Text(textInButton, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: bold, color: Colors.white))]))));
  }
}
