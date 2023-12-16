// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:edeft/DB/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentStudyMaterialsPage extends StatefulWidget {
  const StudentStudyMaterialsPage({Key? key}) : super(key: key);
  @override
  State<StudentStudyMaterialsPage> createState() => _StudentStudyMaterialsPageState();
}

class _StudentStudyMaterialsPageState extends State<StudentStudyMaterialsPage> {
  // final List _topicList =["Quantum mechanism","Theory of relative","Machine Learning","Quantum Computing","E- library","N-list","Open Library","Z library","National Digital Library","OneDrive"];
  // final List _subList =["Physics","Modern Physics","CS","CS","Library","Library","Library","Library","Library","Library"];
  // final List _urlList =["https://tinyurl.com/yck8ecry","https://tinyurl.com/3pne73ve","https://tinyurl.com/4y28mnw2","https://tinyurl.com/4kbnf4wk","https://uniqueacademyforcommerce.com/e-library/","https://nlist.inflibnet.ac.in/","https://openlibrary.org/","https://zlibrary.to/","https://ndl.iitkgp.ac.in/","https://www.overdrive.com/"];

  // final List _topicList = [];
  // final List _subList = [];
  // final List _urlList = [];

  Future<void> _launchUrl(String i) async {
    var uri = i;
    var linker = Uri.parse(uri);
    if (await canLaunchUrl(linker)) {
      await launchUrl(linker);
    } else {
      throw 'Could not launch $linker';
    }
  }

  @override
  Widget build(BuildContext context) {
    final studyMaterialsModelProvider = Provider.of<StudyMaterialsModelProvider>(context);
    final studyMaterials = studyMaterialsModelProvider.studyMaterialsModel;
    var _topicList = studyMaterials?.topicList as List<dynamic>;
    var _subList = studyMaterials?.subList as List<dynamic>;
    var _urlList = studyMaterials?.urlList as List<dynamic>;

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
          'Study Materials',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _topicList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            child: GestureDetector(
              onTap: () => _launchUrl(_urlList[index]),
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE2F6FF),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    children: [
                      const SizedBox(
                        width: 50.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            // foregroundColor: Colors.redAccent,
                            backgroundImage: NetworkImage("https://i.postimg.cc/sxWrSpJZ/image.png"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Wrap(direction: Axis.vertical, crossAxisAlignment: WrapCrossAlignment.start, alignment: WrapAlignment.center, children: <Widget>[
                        Text(
                          _topicList[index],
                          style: const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(_subList[index], style: const TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ]),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
