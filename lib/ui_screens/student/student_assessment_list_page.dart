import 'package:edeft/ui_screens/student/student_assesment_result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../DB/provider.dart';

class StudentAssessmentListPage extends StatefulWidget {
  const StudentAssessmentListPage({Key? key}) : super(key: key);

  @override
  State<StudentAssessmentListPage> createState() => _StudentAssessmentListPageState();
}

class _StudentAssessmentListPageState extends State<StudentAssessmentListPage> {
  List<String> listAdd() {
    String exam1 = "first Term";
    final List<String> names1 = [];
    names1.add(exam1);
    return names1;
  }

  List names = ["test 1", "test 2", "test 3", "test 4", "test 5", "test 6", "test 7", "test 8", "test 9", "test 10"];

  @override
  Widget build(BuildContext context) {
    MyData myData = Provider.of<MyData>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Assessment',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 18, 10),
        child: ListView.builder(
          itemCount: names.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              color: const Color(0xFFE2F6FF),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      names[index],
                      style: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            myData.setMyVariable(index);
                            Provider.of<MyData>(context, listen: false).setMyVariable(index);
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StudentAssessmentResultPage()));
                        },
                        icon: const Icon(Icons.arrow_circle_right_outlined)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
