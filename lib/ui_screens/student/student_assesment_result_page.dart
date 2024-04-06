import 'package:edeft/ui_screens/student/student_assessment_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../DB/provider.dart';

class StudentAssessmentResultPage extends StatefulWidget {
  const StudentAssessmentResultPage({Key? key}) : super(key: key);

  @override
  State<StudentAssessmentResultPage> createState() => _StudentAssessmentResultPageState();
}

class _StudentAssessmentResultPageState extends State<StudentAssessmentResultPage> {
  int total = 100;
  int newVariable = 0;

  List<List<dynamic>> resultArray = [
    [
      ['Arabic', 95],
      ["English", 95],
      ["Biology", 80],
      ["Chemistry", 95],
      ["Information Technology", 100],
      ["Malayalam", 92],
      ["Mathematics", 100],
      ["Physics", 85],
      ["Social Science", 10]
    ],
    [
      ['Arab', 90],
      ["Engli", 95],
      ["Biolo", 80],
      ["Chemis", 95],
      ["Information Techno", 10],
      ["Malayal", 92],
      ["Mathemat", 10],
      ["Physi", 8],
      ["Social Scien", 10]
    ],
    [
      ['Arab', 90],
      ["Engli", 95],
      ["Biolo", 80],
      ["Chemis", 95],
      ["Information Techno", 10],
      ["Malayal", 92],
      ["Mathemat", 10],
      ["Physi", 8],
      ["Social Scien", 10]
    ],
    [
      ['Arab', 90],
      ["Engli", 95],
      ["Biolo", 80],
      ["Chemis", 95],
      ["Information Techno", 10],
      ["Malayal", 92],
      ["Mathemat", 10],
      ["Physi", 8],
      ["Social Scien", 10]
    ],
    [
      ['Arab', 90],
      ["Engli", 95],
      ["Biolo", 80],
      ["Chemis", 95],
      ["Information Techno", 10],
      ["Malayal", 92],
      ["Mathemat", 10],
      ["Physi", 8],
      ["Social Scien", 10]
    ],
    [
      ['Arab', 90],
      ["Engli", 95],
      ["Biolo", 80],
      ["Chemis", 95],
      ["Information Techno", 10],
      ["Malayal", 92],
      ["Mathemat", 10],
      ["Physi", 8],
      ["Social Scien", 10]
    ],
    [
      ['Arabic', 90],
      ["English", 95],
      ["Biology", 8],
      ["Chemistry", 9],
      ["Information Technology", 10],
      ["Malayalam", 92],
      ["Mathematics", 10],
      ["Physics", 8],
      ["Social Science", 100]
    ],
    [
      ['Arabic', 94],
      ["English", 9],
      ["Biology", 8],
      ["Chemistry", 92],
      ["Information Technology", 78],
      ["Malayalam", 94],
      ["Mathematics", 18],
      ["Physics", 8],
      ["Social Science", 15]
    ],
    [
      ['Arabic', 9],
      ["English", 85],
      ["Biology", 8],
      ["Chemistry", 9],
      ["Information Technology", 52],
      ["Malayalam", 9],
      ["Mathematics", 10],
      ["Physics", 85],
      ["Social Science", 100]
    ],
    [
      ['Arabic', 90],
      ["English", 95],
      ["Biology", 80],
      ["Chemistry", 95],
      ["Information Technology", 50],
      ["Malayalam", 30],
      ["Mathematics", 0],
      ["Physics", 8],
      ["Social Science", 100]
    ]
  ];

  List<dynamic> subjects = [];
  List<dynamic> marks = [];
  // List<String> names1 = [];

  @override
  void initState() {
    super.initState();
    newVariable = Provider.of<MyData>(context, listen: false).myVariable;
    if (newVariable >= 0) {
      int rowIndex = newVariable;
      subjects = resultArray[rowIndex].map((column) => column[0]).toList();
      marks = resultArray[rowIndex].map((column) => column[1]).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(builder: (context) => const StudentAssessmentListPage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            'Examination Result',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFfafafa),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
              },
              children: _buildRows(subjects, marks, total),
            ),
          ),
        ));
  }
}

List<TableRow> _buildRows(List<dynamic> subjects, List<dynamic> marks, int total) {
  List<TableRow> rows = [];

  var h = _buildTableHead();
  rows.add(h);
  for (int i = 0; i < subjects.length; i++) {
    var b = _buildEmptyTableRow(height: 8);
    var a = _buildTableRow(
      subjects[i],
      marks[i].toString(),
      _getGrade(marks[i], total),
    );
    rows.add(b);
    rows.add(a);
  }

  return rows;
}

TableRow _buildTableHead() {
  return const TableRow(
    decoration: BoxDecoration(color: Color(0xFF00b2ff)),
    children: [
      TableCell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 8, 0, 8),
          child: Text(
            "Subject",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Mark",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Grade",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

TableRow _buildTableRow(String subject, String mark, String grade) {
  return TableRow(
    decoration: const BoxDecoration(color: Color(0xFFE2F6FF)),
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
          child: Text(
            subject,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            mark,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            grade,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

String _getGrade(int mark, int total) {
  // Determine the grade based on the mark
  // You can implement your own grading system here
  double grade = (mark / total) * total;
  if (grade >= 90) {
    return 'A+';
  } else if (grade >= 80) {
    return 'A';
  } else if (grade >= 70) {
    return 'B';
  } else if (grade >= 60) {
    return 'C';
  } else if (grade >= 50) {
    return 'D';
  } else {
    return 'F';
  }
}

TableRow _buildEmptyTableRow({double height = 10}) {
  return TableRow(
    children: [
      SizedBox(height: height),
      SizedBox(height: height),
      SizedBox(height: height),
    ],
  );
}
