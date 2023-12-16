// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';

class CommonElementsViewModel extends ChangeNotifier {

  late DateTime currentDate;

  calendarModel() {
    // Initialize with the current date
    currentDate = DateTime.now();
  }

  void navigateToPreviousMonth() {
    currentDate = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    notifyListeners();
  }

  void navigateToNextMonth() {
    currentDate = DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
    notifyListeners();
  }

  void navigateToPreviousYear() {
    currentDate = DateTime(currentDate.year - 1, currentDate.month, currentDate.day);
    notifyListeners();
  }

  void navigateToNextYear() {
    currentDate = DateTime(currentDate.year + 1, currentDate.month, currentDate.day);
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
   DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }
  DateTime _selectedStartDate = DateTime.now();
  DateTime? _selectedEndDate;

  DateTime get selectedStartDate => _selectedStartDate;
  DateTime? get selectedEndDate => _selectedEndDate;

  void setSelectedStartDate(DateTime date) {
    _selectedStartDate = date;
    notifyListeners();
  }

  void setSelectedEndDate(DateTime? date) {
    _selectedEndDate = date;
    notifyListeners();
  }

 void toggleSelectedDate(DateTime date) {
  if (_selectedEndDate != null) {
    // Select the start date if there's no start date or if the end date is already set
    _selectedStartDate = date;
    _selectedEndDate = null;
  } else if (date.isAfter(_selectedStartDate)) {
    // Select the end date if it's after the start date
    _selectedEndDate = date;
  } else {
    // Select a new start date if the tapped date is before the current start date
    _selectedStartDate = date;
    _selectedEndDate = null;
  }
  notifyListeners();
}

}


