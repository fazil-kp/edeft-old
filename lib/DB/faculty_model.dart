// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class FacultyModel {
  final List<String> NAME;
  final List<String> DESIGNATION;
  final List<String> IMAGE;


  const FacultyModel({
    required this.NAME,
    required this.DESIGNATION,
    required this.IMAGE,
  });

  toJson() {
    return { "NAME" : FieldValue.arrayUnion([NAME]), "DESIGNATION" : FieldValue.arrayUnion([DESIGNATION]), "IMAGE" : FieldValue.arrayUnion([IMAGE])};
  }

  /// step 1 - Map student fetched from firebase to FacultyModel
  factory FacultyModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return FacultyModel(
        NAME: data["NAME"],
        DESIGNATION: data["DESIGNATION"],
        IMAGE: data["IMAGE"]
    );

  }

}