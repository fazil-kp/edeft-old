import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class StudentAttendancePage extends StatefulWidget {
  const StudentAttendancePage({Key? key}) : super(key: key);

  @override
  State<StudentAttendancePage> createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  List<int> todayAttendance = [1, -1];
  Color todayAttendanceFN = Colors.black12;
  Color todayAttendanceAN = Colors.black12;
  Color fnbg = Colors.white;
  Color anbg = Colors.white;

  int? selectedIndex;
  String month = '';
  int index = 2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (todayAttendance[0] == 0) {
      todayAttendanceFN = Colors.red;
    } else if (todayAttendance[0] == 1) {
      todayAttendanceFN = Colors.green;
    }

    if (todayAttendance[1] == 0) {
      todayAttendanceAN = Colors.red;
    } else if (todayAttendance[1] == 1) {
      todayAttendanceAN = Colors.green;
    }

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('attendance').doc('10A').collection('EMEA10A01').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(color: Colors.white, child: const Center(child: CircularProgressIndicator()));
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Attendance',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white70,
              elevation: 0,
              leading: const BackButton(color: Colors.black),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Today's Attendance Card
                Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.all(16),
                  child: ListTile(
                    title: const Text(
                      'Today\'s attendance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                      width: size.width / 4,
                      child: Wrap(
                        children: [
                          CircleAvatar(
                            backgroundColor: todayAttendanceFN,
                            child: const Text(
                              'FN',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(width: size.width / 50),
                          CircleAvatar(
                            backgroundColor: todayAttendanceAN,
                            child: const Text(
                              'AN',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //Month list Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: size.height / 16,
                  child: ListView.builder(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemCount: months.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: size.width / 4,
                        child: InkWell(
                          onTap: () {
                            _monthSelected(index);
                          },
                          child: Card(
                            color: selectedIndex == index ? Colors.cyan : null,
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                months[index],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width / 20),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: Container(
                      //color: Colors.grey,
                      //height: ,
                      margin: const EdgeInsets.all(16),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: size.width / 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: size.height / 7),
                        controller: ScrollController(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final date = snapshot.data!.docs[index].get('DATE');
                          final fn = snapshot.data!.docs[index].get('FN');
                          final an = snapshot.data!.docs[index].get('AN');

                          if (fn == true) {
                            fnbg = Colors.green;
                          } else if (fn == false) {
                            fnbg = Colors.red;
                          }

                          if (an == true) {
                            anbg = Colors.green;
                          } else if (an == false) {
                            anbg = Colors.red;
                          }

                          return SizedBox(
                            width: size.width / 5,
                            child: Card(
                              elevation: 3,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Wrap(children: [
                                Container(
                                  width: size.width,
                                  height: size.height / 20,
                                  decoration: const BoxDecoration(color: Color(0xFF00B2FF), borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                  child: Center(
                                    child: Text(
                                      date,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width / 20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 12,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: fnbg,
                                        radius: size.width / 18,
                                        child: const Text(
                                          'FN',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: size.width / 20),
                                      CircleAvatar(
                                        backgroundColor: anbg,
                                        radius: size.width / 18,
                                        child: const Text(
                                          'AN',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        },
                      )),
                ),
              ],
            ),
          );
        });
  }

  void _monthSelected(int index) {
    setState(() {
      selectedIndex = index;

      month = months[index];
      var date = DateTime.now();
      var newFormat = DateFormat("yy-MMM-dd");
      String stringDate = newFormat.format(date);

      SnackBar snackBar = SnackBar(
        content: Text(stringDate),
        duration: const Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
