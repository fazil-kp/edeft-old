// ignore_for_file: must_be_immutable

import 'package:edeft/DB/provider.dart';
import 'package:edeft/ui_screens/student/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentFacultiesListPage extends StatefulWidget {
  const StudentFacultiesListPage({Key? key}) : super(key: key);

  @override
  State<StudentFacultiesListPage> createState() => _StudentFacultiesListPageState();
}

class _StudentFacultiesListPageState extends State<StudentFacultiesListPage> {
  int i = 0, j = 0, mainStaff = 3;

  @override
  Widget build(BuildContext context) {
    final facultyModelProvider = Provider.of<FacultyModelProvider>(context);
    final faculty = facultyModelProvider.facultyModel;

    var facultiesName = faculty?.NAME as List<dynamic>;
    var facultiesDesignation = faculty?.DESIGNATION as List<dynamic>;
    var facultiesImage = faculty?.IMAGE as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(builder: (context) => const StudentHomePage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Faculties',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        //Theme.of(context).accentColor,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFfdfdfd),
        child: ListView(children: [
          Column(
            children: [
              for (i = 0; i < mainStaff; i++)
                CustomCardWidget(
                  name: facultiesName[i],
                  designation: facultiesDesignation[i],
                  profileImage: facultiesImage[i],
                ),
              for (j = mainStaff; j < (facultiesName.length - 1); j += 2)
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TutorCardWidget(
                        name: facultiesName[j],
                        designation: facultiesDesignation[j],
                        profileImage: facultiesImage[j],
                        start: 18.0,
                        end: 0.0,
                      ),
                      TutorCardWidget(
                        name: facultiesName[j + 1],
                        designation: facultiesDesignation[j + 1],
                        profileImage: facultiesImage[j + 1],
                        start: 0.0,
                        end: 18.0,
                      ),
                    ],
                  ),
                ),
              if (((facultiesName.length) - mainStaff).isOdd || (facultiesName.length) == 1)
                CustomCardWidget(
                  name: facultiesName[facultiesName.length - 1],
                  designation: facultiesDesignation[facultiesName.length - 1],
                  profileImage: facultiesImage[facultiesName.length - 1],
                ),
            ],
          ),
        ]),
      ),
    );
  }
}

class TutorCardWidget extends StatelessWidget {
  String profileImage = "";
  String name = "";
  String designation = "";
  double start, end;

  TutorCardWidget({
    required this.name,
    required this.designation,
    required this.profileImage,
    required this.start,
    required this.end,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(start, 3, end, 0),
        child: SizedBox(
          child: Card(
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  spacing: 9.0,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profileImage),
                      radius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                          ),
                          Text(
                            designation,
                            style: const TextStyle(color: Color(0xFF404040)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  String profileImage = "";
  String name = "";
  String designation = "";

  CustomCardWidget({
    required this.name,
    required this.designation,
    required this.profileImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 5),
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 17.0,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 17, 0, 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                        ),
                        Text(
                          designation,
                          style: const TextStyle(color: Color(0xFF404040)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
