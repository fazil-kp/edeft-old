// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class AssignmentListModel {
  final List<String> topic;
  final List<Timestamp> last_date;


  const AssignmentListModel({
   required this.topic,
   required this.last_date
});

  factory AssignmentListModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return AssignmentListModel(
        topic: data['TOPIC'],
        last_date: data['LAST_DATE'],
    );
  }

}
