// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edeft/DB/assignment_list_model.dart';
import 'package:edeft/DB/faculty_model.dart';
import 'package:edeft/DB/student_model.dart';
import 'package:edeft/DB/study_materials_model.dart';
import 'package:flutter/foundation.dart';

class MyData extends ChangeNotifier {
  int _myVariable = 0;

  int get myVariable => _myVariable;

  void setMyVariable(int value) {
    _myVariable = value;
    notifyListeners();
  }
}

class StudentModelProvider with ChangeNotifier {
  StudentModel? _studentModel;

  StudentModel? get studentModel => _studentModel;

  set studentModel(StudentModel? value) {
    _studentModel = value;
    notifyListeners();
  }
}

class FacultyModelProvider with ChangeNotifier {
  FacultyModel? _facultyModel;

  FacultyModel? get facultyModel => _facultyModel;

  set facultyModel(FacultyModel? value) {
    _facultyModel = value;
    notifyListeners();
  }
}

class StudyMaterialsModelProvider with ChangeNotifier {
  StudyMaterialsModel? _studyMaterialsModel;

  StudyMaterialsModel? get studyMaterialsModel => _studyMaterialsModel;

  set studyMaterialsModel(StudyMaterialsModel? value) {
    _studyMaterialsModel = value;
    notifyListeners();
  }
}

class AssignmentListProvider with ChangeNotifier {
  AssignmentListModel? _assignmentListModel;
  List<AssignmentListModel>? _documents;

  AssignmentListModel? get assignmentListModel => _assignmentListModel;
  List<AssignmentListModel>? get documents => _documents;

  set assignmentListModel(AssignmentListModel? value) {
    _assignmentListModel = value;
    notifyListeners();
  }

  set documents(List<AssignmentListModel>? value) {
    _documents = value;
    notifyListeners();
  }
}

class AssignmentListModelProvider extends ChangeNotifier {
  List<AssignmentListModel> documents = [];

  Future<void> fetchDocuments(String _class) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionRef = firestore.collection('edeft').doc('EMEA').collection('admin').doc('assignments').collection('classes').doc(_class).collection('topic');
    QuerySnapshot querySnapshot = await collectionRef.get();

    documents = querySnapshot.docs.map((doc) {
      return AssignmentListModel(
        topic: doc['TOPIC'],
        last_date: doc['LAST_DATE'],
      );
    }).toList();

    notifyListeners();
  }
}
