import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'admin_home_page.dart';

class AdminTimeTablePage extends StatefulWidget {
  const AdminTimeTablePage({Key? key}) : super(key: key);

  @override
  State<AdminTimeTablePage> createState() => _AdminTimeTablePageState();
}

class _AdminTimeTablePageState extends State<AdminTimeTablePage> {

  final date = List<DateTime>.generate(5, (i) => DateTime(2020,12,i));

  List<String> dateList = [];

  List<List<dynamic>> timeTableList = List.generate(5, (_) => []);
  int noOfPeriod = 0;
  int noOfTable = 0;



  // List<List<dynamic>> timeTable =[
  //   [['7.00 AM-8.15 AM','English','Steve Jobs'], ['8.30 AM-9.15 AM','History','Karl Pay'], ['9.30 AM-10.30 AM','AI','Sam Altman']],
  //   [['7.00 AM-8.15 AM','Physics','Elon Musk'], ['8.30 AM-9.15 AM','Maths','Einstein'], ['9.30 AM-10.30 AM','Chem','Dalton']],
  //   [['7.00 AM-8.15 AM','Biology','Charles'], ['8.30 AM-9.15 AM','Maths','Fazil'], ['9.30 AM-10.30 AM','Physics','Stephen']],
  // ];

  List<dynamic> timeList = [];
  List<dynamic> subjectList = [];
  List<dynamic> tutorList = [];

  TextEditingController periodController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController tutorController = TextEditingController();
  TextEditingController tableController = TextEditingController();

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12,),
                TextField(
                  controller: periodController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Number of periods',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 12,),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text("Next",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.pop(context);
                  String period = periodController.text;
                  String date = dateController.text;


                  setState(() {
                    noOfPeriod = int.parse(period.toString());
                    noOfTable = 1;
                    dateList.add(date);
                  });


                  if(noOfPeriod>0){

                    timeTableAdd();

                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wrong input'),),);
                    Navigator.pop(context);
                  }

                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void timeTableAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12,),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: subController,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: tutorController,
                  decoration: InputDecoration(
                    labelText: 'Tutor',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text("Submit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.pop(context);
                  String sub = subController.text;
                  String times = subController.text;
                  String tutor = tutorController.text;
                  // do something with name and age



                  setState(() {
                    subjectList.add(sub);
                    tutorList.add(tutor);
                    timeList.add(times);
                    (subjectList.length>=noOfPeriod)?noOfPeriod=subjectList.length:timeTableAdd();
                  });

                  timeController.text="";
                  subController.text="";
                  tutorController.text="";
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminHomePage()));
        },
            icon: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
        title: const Text('Time Table',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body:
      noOfTable==1?
      ListView.builder(
          itemCount: noOfTable,
          itemBuilder: (context,i)
          {
            // subjectList = timeTable[i].map((column) => column[1]).toList();
            // timeList = timeTable[i].map((column) => column[0]).toList();
            // tutorList = timeTable[i].map((column) => column[2]).toList();

            timeTableList[noOfTable-1].add(timeList);
            timeTableList[noOfTable-1].add(subjectList);
            timeTableList[noOfTable-1].add(tutorList);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dateList[i],
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 8,color: const Color(0xFF00b2ff)
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Table(
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(1.3),
                          2: FlexColumnWidth(2),
                        },
                        children:
                        _buildTable(timeList, subjectList, tutorList)
                    ),
                  ),
                  const SizedBox(height: 5,)
                ],
              ),
            );
          }
      ):const Center(
        child: Text('Timetable has not been published yet.'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87 ,
        onPressed: (){

          _showDialog();

        },
        child: const Icon(Icons.add),),
    );
  }
}



List<TableRow> _buildTable(List<dynamic> time, List<dynamic> subject,List<dynamic> tutor) {
  List<TableRow> rows = [];

  var h = _timeTableHead();
  rows.add(h);
  for (int i = 0; i < time.length; i++) {
    var a = _timeTableRow(
        time[i],
        subject[i],
        tutor[i]
    );
    rows.add(a );


  }
  var b = _buildEmptyTableRow();
  rows.add(b);
  return rows;
}


TableRow _timeTableHead() {
  return const TableRow(
    decoration: BoxDecoration(
        color: Color(0xFF00b2ff)
    ),
    children: [
      TableCell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 8, 0, 8),
          child: Text(
            "Time",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Subject",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Tutor",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
      ),
    ],
  );
}


TableRow _timeTableRow(String time, String sub, String tutor) {
  return TableRow(
    decoration: const BoxDecoration(
        color: Color(0xFF00b2ff)
    ),
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 3, 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                time,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                sub,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 3, 10, 5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tutor,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

TableRow _buildEmptyTableRow({double height = 10}) {
  return TableRow(
    decoration: const BoxDecoration(
        color: Color(0xFF00b2ff)
    ),
    children: [
      SizedBox(height: height),
      SizedBox(height: height),
      SizedBox(height: height),
    ],
  );
}


