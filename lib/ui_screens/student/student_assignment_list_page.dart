// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edeft/DB/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class StudentAssignmentListPage extends StatelessWidget {
  StudentAssignmentListPage({Key? key}) : super(key: key);

  int j = 0;

  List<num> done = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  late List<String> topic = [];
  late List<Timestamp> last_date = [];

  @override
  Widget build(BuildContext context) {
    final assignmentListProvider = Provider.of<AssignmentListProvider>(context);
    final assignments = assignmentListProvider.assignmentListModel;

    topic = assignments?.topic as List<String>;
    last_date = assignments?.last_date as List<Timestamp>;

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
          'Assignments',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: topic.length,
        itemBuilder: (context, i) {
          final date = DateTime.fromMillisecondsSinceEpoch(last_date[i].millisecondsSinceEpoch);
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
            child: ListTile(
              selectedTileColor: const Color(0XFFBDCDD6),
              onTap: () {
                j = i;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentAssignmentSubmitPage(
                          j: i,
                          assignmentListPage: this,
                        )));
              },
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
                      topic[i],
                      style: TextStyle(color: done[i] == 1 ? Colors.green : Colors.red),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 5,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          "Last Date : ${date.day}-${date.month}-${date.year}",
                          style: const TextStyle(color: Color(0xA6000000)),
                        ),
                        if (done[i] == 1)
                          SizedBox(
                            height: 25,
                            width: 30,
                            child: Lottie.network('https://assets6.lottiefiles.com/packages/lf20_bqurfq5c.json'),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StudentAssignmentSubmitPage extends StatefulWidget {
  final int j;
  final StudentAssignmentListPage assignmentListPage;

  const StudentAssignmentSubmitPage({Key? key, required this.j, required this.assignmentListPage}) : super(key: key);

  @override
  State<StudentAssignmentSubmitPage> createState() => _StudentAssignmentSubmitPageState();
}

class _StudentAssignmentSubmitPageState extends State<StudentAssignmentSubmitPage> {
  DateTime today = DateTime.now();

  List<PlatformFile> files = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(builder: (context) => StudentAssignmentListPage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.tertiary, boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8.0, // soften the shadow
                        offset: Offset(
                          3.0, // Move to right horizontally
                          1.0, // Move to bottom Vertically
                        ),
                      )
                    ]),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(7, 15, 7, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.assignmentListPage.topic[widget.j],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                            width: double.infinity,
                          ),
                          Text(
                            "Date :${today.day}-${today.month}-${today.year}",
                          ),
                        ],
                      ),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Upload the File",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(border: Border.all(width: 2)),
                child: OutlinedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(withReadStream: true, allowMultiple: true, type: FileType.custom, allowedExtensions: ['pdf', 'docx', 'doc', 'xls', 'xlsx']);

                    if (result == null) return;
                    setState(() {
                      files = result.files;
                    });
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    //print(files);
                  },
                  child: const Text('Submit')),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  children: [
                    Text(
                      "  View Assignment : ",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 35,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    for (int i = 0; i < files.length; i++)
                      InkWell(
                        onTap: () => openFile(files[i]),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(8),
                          color: Colors.white70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(color: getFileColor(fileExtension(i)!), borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  '.${fileExtension(i)}',
                                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                files[i].name,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                              ),
                              Text(
                                '${fileSize(i)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? fileExtension(int i) {
    final extension = files[i].extension ?? 'none';
    return extension;
  }

  String? fileSize(int i) {
    final kb = files[i].size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
    return fileSize;
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

Color getFileColor(String extension) {
  switch (extension.toLowerCase()) {
    case 'pdf':
      return Colors.redAccent;
    case 'doc':
    case 'docx':
      return Colors.blueAccent;
    case 'xls':
    case 'xlsx':
      return Colors.green;
    default:
      return Colors.grey;
  }
}
