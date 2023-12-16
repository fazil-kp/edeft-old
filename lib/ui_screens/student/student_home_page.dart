// ignore_for_file: non_constant_identifier_names, deprecated_member_use, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edeft/DB/assignment_list_model.dart';
import 'package:edeft/DB/provider.dart';
import 'package:edeft/common_elements/alert_box.dart';
import 'package:edeft/const/constant_fonts.dart';
import 'package:edeft/ui_screens/login_page.dart';
import 'package:edeft/ui_screens/student/student_assessment_list_page.dart';
import 'package:edeft/ui_screens/student/student_assignment_list_page.dart';
import 'package:edeft/ui_screens/student/student_attendance_page.dart';
import 'package:edeft/ui_screens/student/student_contact_us_page.dart';
import 'package:edeft/ui_screens/student/student_faculties_list_page.dart';
import 'package:edeft/ui_screens/student/student_my_account_page.dart';
import 'package:edeft/ui_screens/student/student_fee_details_page.dart';
import 'package:edeft/ui_screens/student/student_study_materials_page.dart';
import 'package:edeft/ui_screens/student/student_time_table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../DB/faculty_model.dart';
import '../../DB/student_model.dart';
import '../../DB/study_materials_model.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  bool _isLoading = true;
  int i = 0;

  @override
  void initState() {
    super.initState();
    getStudentDetails();
    getFacultyDetails();
    //getStudyMaterials();
    _loadData();
  }

  Future<void> getStudentDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('userName').toString();

    final snapshot = FirebaseFirestore.instance.collection('EMEA').doc('student').collection(username).doc('profile');
    final data = await snapshot.get();
    if (data.exists) {
      final studentData = data.data();
      final studentProvider = Provider.of<StudentModelProvider>(context, listen: false);
      studentProvider.studentModel = StudentModel(
        STUDENT_CARD: List.castFrom<dynamic, String>(studentData?['STUDENT_CARD']),
        PERSONAL_DETAILS: List.castFrom<dynamic, String>(studentData?['PERSONAL_DETAILS']),
        ADDRESS: List.castFrom<dynamic, String>(studentData?['ADDRESS']),
        PARENT_DETAILS: List.castFrom<dynamic, String>(studentData?['PARENT_DETAILS']),
        ACADEMIC_DETAILS: List.castFrom<dynamic, String>(studentData?['ACADEMIC_DETAILS']),
      );

      String _class = studentProvider.studentModel?.STUDENT_CARD[1] as String;

      getStudyMaterials(_class);

      // AssignmentListModelProvider modelProvider = AssignmentListModelProvider();
      // modelProvider.fetchDocuments(_class);

      getAssignmentList(_class);
    }
  }

  Future<void> getFacultyDetails() async {
    final snapshot = FirebaseFirestore.instance.collection('EMEA').doc('admin').collection('faculties').doc('details');
    final data = await snapshot.get();
    if (data.exists) {
      final facultyData = data.data();
      final facultyProvider = Provider.of<FacultyModelProvider>(context, listen: false);
      facultyProvider.facultyModel = FacultyModel(NAME: List.castFrom<dynamic, String>(facultyData?['NAME']), DESIGNATION: List.castFrom<dynamic, String>(facultyData?['DESIGNATION']), IMAGE: List.castFrom<dynamic, String>(facultyData?['IMAGE']));
    }
  }

  Future<void> getStudyMaterials(String _class) async {
    final snapshot = FirebaseFirestore.instance.collection('EMEA').doc('admin').collection('study_materials').doc(_class);
    final data = await snapshot.get();
    if (data.exists) {
      final studyMaterials = data.data();
      final studyMaterialsProvider = Provider.of<StudyMaterialsModelProvider>(context, listen: false);
      studyMaterialsProvider.studyMaterialsModel = StudyMaterialsModel(topicList: List.castFrom<dynamic, String>(studyMaterials?['TOPIC_LIST']), subList: List.castFrom<dynamic, String>(studyMaterials?['SUB_LIST']), urlList: List.castFrom<dynamic, String>(studyMaterials?['URL_LIST']));
    }
  }

  Future<void> getAssignmentList(String _class) async {
    final snapshot = FirebaseFirestore.instance.collection('edeft').doc('EMEA').collection('admin').doc('assignments').collection('classes').doc(_class);
    final data = await snapshot.get();

    if (data.exists) {
      final assignmentList = data.data();
      final assignmentListProvider = Provider.of<AssignmentListProvider>(context, listen: false);
      assignmentListProvider.assignmentListModel = AssignmentListModel(
        topic: List.castFrom<dynamic, String>(assignmentList?['TOPIC']),
        last_date: List.castFrom<dynamic, Timestamp>(assignmentList?['LAST_DATE']),
      );
    }
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final studentModelProvider = Provider.of<StudentModelProvider>(context);
    final student = studentModelProvider.studentModel;

    final STUDENT_CARD = student?.STUDENT_CARD;

    var size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          // Exit the app when back button is pressed on the Home screen
          await SystemNavigator.pop();
          return true;
        },
        child: _isLoading
            ? Container(color: Colors.white, child: const Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )))
            : Scaffold(
                drawer: Drawer(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: size.height / 3,
                        child: const DrawerHeader(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                              color: Colors.black12,
                              image: DecorationImage(
                                image: NetworkImage('https://rnaip.com/wp-content/uploads/2022/05/RNA-GREY-LOGO-SHADOW.png'),
                              )),
                          child: Text('edeft'),
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                          size: size.height / 24,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48),
                        ),
                      ),
                      ListTile(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentContactUsPage())),
                        leading: Icon(
                          Icons.call,
                          color: Colors.black,
                          size: size.height / 24,
                        ),
                        title: Text(
                          'Contact Us',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48),
                        ),
                      ),
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
                          leading: Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: size.height / 24,
                          ),
                          title: Text(
                            'Log out',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 48),
                          ),
                        ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
                      Positioned(
                        child: Container(
                          height: size.height / 2.5,
                          width: size.width,
                          decoration: const BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                        ),
                      ),

                      Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          height: size.height / 4.5,
                          width: size.width,
                          decoration: const BoxDecoration(color: Color(0xFF00B2FF), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                        ),
                      ),

                      //App Bar
                      Positioned(
                        top: -8,
                        left: 0.0,
                        right: 0.0,
                        child: AppBar(
                          iconTheme: const IconThemeData(color: Colors.black),
                          title: const Text(
                            'edeft',
                            style: TextStyle(color: Colors.black, fontFamily: bold),
                          ),
                          centerTitle: true,
                          backgroundColor: const Color(0xFF00B2FF),
                          elevation: 0,
                        ),
                      ),
                      Positioned(
                        top: 31.0,
                        right: 10.0,
                        child: i == 0
                            ? IconButton(
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
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              )
                            : const SizedBox(),
                      ),

                      //Student Details card
                      Positioned(
                        top: size.height / 7,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          color: Colors.white,
                          child: SizedBox(
                            width: size.width / 1.2,
                            height: size.height / 5,
                            child: Wrap(
                              direction: Axis.vertical,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width / 1.2,
                                  height: size.height / 20,
                                ),
                                Text(
                                  STUDENT_CARD![0],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height / 45,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 200,
                                ),
                                Text(
                                  STUDENT_CARD[1],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 200,
                                ),
                                Text(
                                  STUDENT_CARD[2],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: size.height / 10,
                        child: CircleAvatar(
                          radius: size.height / 16,
                          backgroundColor: Colors.grey,
                          foregroundImage: NetworkImage(STUDENT_CARD[3]),
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                      ),
                      //Menu Text
                      Positioned(
                        top: size.height / 2.8,
                        left: size.width / 12,
                        child: Text(
                          'Menu',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height / 45),
                        ),
                      ),
                    ]),
                    //Menu Buttons
                    SizedBox(
                      width: double.infinity,
                      height: size.height / 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //First Row
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                const ButtonInMenu(navigationInButton: StudentAttendancePage(), iconInButton: Icons.fact_check_rounded, textInButton: "Attendance"),
                                ButtonInMenu(navigationInButton: StudentTimeTablePage(), iconInButton: Icons.view_list_rounded, textInButton: "Time Table"),
                                ButtonInMenu(navigationInButton: StudentAssignmentListPage(), iconInButton: Icons.assignment, textInButton: "Assignment"),
                              ],
                            ),
                            //Second Row
                            const Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                ButtonInMenu(navigationInButton: StudentFacultiesListPage(), iconInButton: Icons.man_rounded, textInButton: "Faculties "),
                                ButtonInMenu(navigationInButton: StudentStudyMaterialsPage(), iconInButton: Icons.menu_book_rounded, textInButton: "Materials "),
                                ButtonInMenu(navigationInButton: StudentFeeDetailsPage(), iconInButton: Icons.payments_rounded, textInButton: "   Fees   "),
                              ],
                            ),
                            //Third Row
                            const Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                ButtonInMenu(navigationInButton: StudentAssessmentListPage(), iconInButton: Icons.assessment_rounded, textInButton: "Assessment"),
                                // ButtonInMenu(navigationInButton: AlertWindow(i: 0, alertHead: "Comming Soon...!", alertText: "Stay Updated we are launching soon......."), iconInButton: Icons.question_answer_rounded, textInButton: "   Q&A    "),
                                ButtonInMenu(navigationInButton: StudentMyAccountPage(), iconInButton: Icons.account_box_rounded, textInButton: "My Account"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottomSheet: DraggableScrollableSheet(
                    initialChildSize: .1,
                    minChildSize: .1,
                    maxChildSize: .64,
                    expand: false,
                    snap: true,
                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                          color: Color(0xFF00B2FF),
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('EMEA').doc('admin').collection('announcements').snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    controller: scrollController,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final notification = snapshot.data!.docs[index].get('MESSAGE');
                                      final date = snapshot.data!.docs[index].get('DATE');
                                      if (index == 0) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: size.width / 5,
                                                height: size.height / 150,
                                                margin: const EdgeInsets.only(bottom: 12),
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black54),
                                              ),
                                              Text(
                                                'Announcements',
                                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: size.height / 36),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        child: ListTile(
                                          title: Text(notification),
                                          trailing: Text(date),
                                        ),
                                      );
                                    });
                              }

                              return Container(
                                  color: Colors.white,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    backgroundColor: Color(0XFF23a4f1),
                                    
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                    strokeWidth: 5,
                                  )));
                            }),
                      );
                    }),
              ));
  }
}

class ButtonInMenu extends StatelessWidget {
  const ButtonInMenu({
    super.key,
    required this.navigationInButton,
    required this.iconInButton,
    required this.textInButton,
  });

  final Widget navigationInButton;
  final IconData iconInButton;
  final String textInButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 8),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => navigationInButton));
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, padding: const EdgeInsets.all(10), elevation: 5, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 0,
              children: [
                Icon(
                  iconInButton,
                  size: 80,
                  color: const Color(0xFF00B2FF),
                ),
                Text(
                  textInButton,
                  style: const TextStyle(color: Colors.black),
                )
              ],
            ),
          )),
    );
  }
}
