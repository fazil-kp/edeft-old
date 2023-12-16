import 'package:cloud_firestore/cloud_firestore.dart';

class StudyMaterialsModel {
  final List<String> topicList;
  final List<String> subList;
  final List<String> urlList;


  const StudyMaterialsModel({
   required this.topicList,
   required this.subList,
   required this.urlList,
});


  factory StudyMaterialsModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return StudyMaterialsModel(
        topicList: data['TOPIC_LIST'],
        subList: ['SUB_LIST'],
        urlList: ['URL_LIST']
    );
  }

}