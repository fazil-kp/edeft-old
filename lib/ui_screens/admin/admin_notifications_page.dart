import 'package:edeft/const/color.dart';
import 'package:edeft/ui_screens/admin/admin_home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AdminNotificationsPage extends StatefulWidget {
  const AdminNotificationsPage({Key? key}) : super(key: key);

  @override
  State<AdminNotificationsPage> createState() => _AdminNotificationsPageState();
}

class _AdminNotificationsPageState extends State<AdminNotificationsPage> {
  //final items = List<String>.generate(50, (i) => " ${i + 1} times Your Attendance marked as absent");
  // final date = List<DateTime>.generate(50, (i) => DateTime(2020,12,i));

  TextEditingController notificationController = TextEditingController();

  var notificationList = [];
  var dateList = [];

  String dropdownValue = 'Select Student';

  var items = ['Select Student', 'Abrar', 'Athul', 'Bahiz', 'Jazi', 'Jazim', 'Sahal', 'Elon Musk', 'Mohammed Anees M'];

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: notificationController,
                  decoration: InputDecoration(
                    labelText: 'Enter the message',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  String topic = notificationController.text;
                  DateTime now = DateTime.now();
                  setState(() {
                    notificationList.add(topic);
                    dateList.add(now);

                    notificationController.text = "";
                    //(nameList.length>=noOfStaff)?noOfStaff=nameList.length:_showDialog();
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminHomePage()));
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
        itemCount: notificationList.length,
        itemBuilder: (context, i) {
          final item = notificationList[i];
          return Dismissible(
              key: Key(item),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                setState(() {
                  notificationList.removeAt(i);
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
                        Text(
                          notificationList[i],
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 5,
                        ),
                        Text(
                          "Date : ${dateList[i].day}-${dateList[i].month}-${dateList[i].year}",
                          style: const TextStyle(color: Color(0xA6000000)),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.blueColor,
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
