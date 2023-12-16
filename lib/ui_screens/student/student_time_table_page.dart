// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StudentTimeTablePage extends StatelessWidget {
  StudentTimeTablePage({Key? key}) : super(key: key);

  final date = List<DateTime>.generate(5, (i) => DateTime(2020, 12, i));

  List<List<dynamic>> timeTable = [
    [
      ['7.00 AM-8.15 AM', 'English', 'Steve Jobs'],
      ['8.30 AM-9.15 AM', 'History', 'Karl Pay'],
      ['9.30 AM-10.30 AM', 'AI', 'Sam Altman']
    ],
    [
      ['7.00 AM-8.15 AM', 'Physics', 'Elon Musk'],
      ['8.30 AM-9.15 AM', 'Maths', 'Einstein'],
      ['9.30 AM-10.30 AM', 'Chem', 'Dalton']
    ],
    [
      ['7.00 AM-8.15 AM', 'Biology', 'Charles'],
      ['8.30 AM-9.15 AM', 'Maths', 'Fazil'],
      ['9.30 AM-10.30 AM', 'Physics', 'Stephen']
    ],
  ];

  List<dynamic> time = [];
  List<dynamic> subject = [];
  List<dynamic> tutor = [];

  @override
  Widget build(BuildContext context) {
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
          'Time Table',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: timeTable.length,
          itemBuilder: (context, i) {
            subject = timeTable[i].map((column) => column[1]).toList();
            time = timeTable[i].map((column) => column[0]).toList();
            tutor = timeTable[i].map((column) => column[2]).toList();
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${date[i].day}-${date[i].month}-${date[i].year}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 8, color: const Color(0xFF00b2ff)), borderRadius: BorderRadius.circular(10)),
                    child: Table(columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(1.3),
                      2: FlexColumnWidth(2),
                    }, children: _buildTable(time, subject, tutor)),
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            );
          }),
    );
  }
}

List<TableRow> _buildTable(List<dynamic> time, List<dynamic> subject, List<dynamic> tutor) {
  List<TableRow> rows = [];

  var h = _timeTableHead();
  rows.add(h);
  for (int i = 0; i < time.length; i++) {
    var a = _timeTableRow(time[i], subject[i], tutor[i]);
    rows.add(a);
  }
  var b = _buildEmptyTableRow();
  rows.add(b);
  return rows;
}

TableRow _timeTableHead() {
  return const TableRow(
    decoration: BoxDecoration(color: Color(0xFF00b2ff)),
    children: [
      TableCell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 8, 0, 8),
          child: Text(
            "Time",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Subject",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Tutor",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

TableRow _timeTableRow(String time, String sub, String tutor) {
  return TableRow(
    decoration: const BoxDecoration(color: Color(0xFF00b2ff)),
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 3, 3, 5),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
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
    decoration: const BoxDecoration(color: Color(0xFF00b2ff)),
    children: [
      SizedBox(height: height),
      SizedBox(height: height),
      SizedBox(height: height),
    ],
  );
}
