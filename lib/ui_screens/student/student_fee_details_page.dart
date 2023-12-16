// ignore_for_file: unused_local_variable, annotate_overrides, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:edeft/ui_screens/student/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../DB/provider.dart';

class StudentFeeDetailsPage extends StatefulWidget {
  const StudentFeeDetailsPage({Key? key}) : super(key: key);

  @override
  State<StudentFeeDetailsPage> createState() => _StudentFeeDetailsPageState();
}

class _StudentFeeDetailsPageState extends State<StudentFeeDetailsPage> {
  final items = List<String>.generate(11, (i) => " If the fee is not paid, the fine will be 1\$ per day( Total fee is ${i + 50} \$)");
  final date = List<DateTime>.generate(14, (i) => DateTime(2020, 12, i));

  void initState() {
    super.initState();
    items.add("Your fees has been successfully credited");
    items.add("Please pay the fine as soon as possible");
    items.add("Your fine has been successfully credited");
    getCollections();
    getSubcollections();
  }

  void getCollections() async {
    QuerySnapshot collectionSnapshot = await FirebaseFirestore.instance.collection('EMEA').get();

    // List<String> collections = collectionSnapshot.docs.map((doc) => doc.id).toList();
  }

  void getSubcollections() async {
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('EMEA').doc('admin').get();

    if (docSnapshot.exists) {
      QuerySnapshot subcollectionSnapshot = await docSnapshot.reference.collection('assignment').get();

      List<String> subcollections = subcollectionSnapshot.docs.map((doc) => doc.id).toList();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    final studentModelProvider = Provider.of<StudentModelProvider>(context);
    final student = studentModelProvider.studentModel;

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
          'Notification',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return Dismissible(
              key: Key(item),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(i);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$item Removed from list'),
                  ),
                );
              },
              background: Container(alignment: Alignment.centerLeft, padding: const EdgeInsets.only(right: 20.0), child: Lottie.network('https://assets1.lottiefiles.com/datafiles/YpOCRxpifd1Xs1n/data.json')),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: ListTile(
                  selectedTileColor: const Color(0XFFBDCDD6),
                  title: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1),
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${student?.STUDENT_CARD[0] ?? 'hello'}'),
                        const SizedBox(
                          width: double.infinity,
                          height: 5,
                        ),
                        Text(
                          "Date : ${date[i].day}-${date[i].month}-${date[i].year}",
                          style: const TextStyle(color: Color(0xA6000000)),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
