import 'dart:typed_data';
import 'package:edeft/models/response_status_model.dart';
import 'package:flutter/cupertino.dart';


class FileUploadViewModel extends ChangeNotifier {
  List<Uint8List> pickedFiles = [];
  ResponseStatusCode responseStatusCode = const ResponseStatusCode(state: ResponseState.none);

  void setPickedFiles(List<Uint8List> files) {
    pickedFiles = files;
    notifyListeners();
  }

  void addPickedFiles(List<Uint8List> files) {
    pickedFiles.addAll(files);
    notifyListeners();
  }

  void removePickedFiles(Uint8List file) {
    pickedFiles.remove(file);
    notifyListeners();
  }

  void clearPickedFiles() {
    pickedFiles.clear();
    notifyListeners();
  }

  void setResponseStatusCode(ResponseState responseStatusCodeState) {
    responseStatusCode = responseStatusCode.copyWith(state: responseStatusCodeState);
    notifyListeners();
  }
}
