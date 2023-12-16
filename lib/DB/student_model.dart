// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final List<String> STUDENT_CARD;
  final List<String> PERSONAL_DETAILS;
  final List<String> ADDRESS;
  final List<String> PARENT_DETAILS;
  final List<String> ACADEMIC_DETAILS;



  const StudentModel({
    required this.STUDENT_CARD,
    required this.PERSONAL_DETAILS,
    required this.ADDRESS,
    required this.PARENT_DETAILS,
    required this.ACADEMIC_DETAILS,
});

  /// step 1 - Map student fetched from firebase to StudentModel
  factory StudentModel.fromFirestore(Map<String, dynamic> data) {
    //final data = document.data()!;
    return StudentModel(
        STUDENT_CARD: data["STUDENT_CARD"],
        PERSONAL_DETAILS: data["PERSONAL_DETAILS"],
        ADDRESS: data["ADDRESS"],
        PARENT_DETAILS: data["PARENT_DETAILS"],
        ACADEMIC_DETAILS: data["ACADEMIC_DETAILS"],
    );
  }

  factory StudentModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> data){
    return StudentModel(
        STUDENT_CARD: data["STUDENT_CARD"],
        PERSONAL_DETAILS: data["PERSONAL_DETAILS"],
        ADDRESS: data["ADDRESS"],
        PARENT_DETAILS: data["PARENT_DETAILS"],
        ACADEMIC_DETAILS: data["ACADEMIC_DETAILS"],
    );
  }

}