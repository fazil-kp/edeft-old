// ignore_for_file: deprecated_member_use

import 'package:edeft/common_elements/button.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/const/color.dart';
import 'package:edeft/view_model/common_elements_view_model.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SimpleCalendar extends StatelessWidget {
  const SimpleCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CommonElementsViewModel>().calendarModel();

    return AlertDialog(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      content: SizedBox(
        width: ResponsiveHelpers.isDesktop(context) ? 450 : 380,
        height: ResponsiveHelpers.isDesktop(context) ? 500 : 370,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveHelpers.isDesktop(context) ? 20.0 : 0, vertical: 10.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                Consumer<CommonElementsViewModel>(
                  builder: (context, model, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () => model.navigateToPreviousMonth(),
                              icon: const Icon(Icons.arrow_back_ios_sharp),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: ResponsiveHelpers.isDesktop(context) ? 40 : 12,
                                  child: Center(
                                    child: Text(
                                      model.currentDate.day.toString(),
                                      textScaleFactor: 2.0,
                                      style: TextStyle(
                                        fontSize: ResponsiveHelpers.isDesktop(context) ? 15 : 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ResponsiveHelpers.isDesktop(context) ? 8 : 10,
                                ),
                                Text(
                                  _getMonthName(model.currentDate.month),
                                  textScaleFactor: 2.0,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelpers.isDesktop(context) ? 10 : 5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => model.navigateToNextMonth(),
                              icon: const Icon(Icons.arrow_forward_ios_sharp),
                            ),
                            ResponsiveHelpers.isDesktop(context)
                                ? IconButton(
                                    onPressed: () => model.navigateToPreviousYear(),
                                    icon: const Icon(Icons.arrow_back_ios_sharp),
                                  )
                                : const SizedBox(),
                            ResponsiveHelpers.isDesktop(context)
                                ? Text(
                                    "${model.currentDate.year}",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(color: Colors.black, fontSize: ResponsiveHelpers.isDesktop(context) ? 15 : 10),
                                  )
                                : const SizedBox(),
                            ResponsiveHelpers.isDesktop(context)
                                ? IconButton(
                                    onPressed: () => model.navigateToNextYear(),
                                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        ResponsiveHelpers.isMobile(context)
                            ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () => model.navigateToPreviousYear(),
                                    icon: const Icon(Icons.arrow_back_ios_sharp),
                                  ),
                                  Text(
                                    "${model.currentDate.year}",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(color: Colors.black, fontSize: ResponsiveHelpers.isDesktop(context) ? 15 : 10),
                                  ),
                                  IconButton(
                                    onPressed: () => model.navigateToNextYear(),
                                    icon: const Icon(Icons.arrow_forward_ios_sharp),
                                  ),
                                ],
                              )
                            : const SizedBox()
                      ],
                    );
                  },
                ),
                SizedBox(height: ResponsiveHelpers.isDesktop(context) ? 28.0 : 10),
                Expanded(
                  child: Consumer<CommonElementsViewModel>(
                    builder: (context, model, _) {
                      return GridView.builder(
                        itemCount: _getDaysInMonth(model.currentDate.year, model.currentDate.month),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1.0, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
                        itemBuilder: (_, i) {
                          int day = i + 1;
                          String cDay = day < 10 ? "0$day" : "$day";
                          String cMonth = model.currentDate.month < 10 ? "0${model.currentDate.month}" : "${model.currentDate.month}";
                          DateTime date = DateTime.parse("${model.currentDate.year}-$cMonth-$cDay");
                          return GestureDetector(
                            onTap: () {
                              // Toggle selection between start and end dates
                              model.toggleSelectedDate(date);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _getColorForDate(date, model),
                              ),
                              child: Center(
                                child: Text(
                                  "$day",
                                  style: TextStyle(
                                    color: date.weekday == DateTime.sunday ? UiColor.errorColor : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Show selected date range
                Button(
                  width: double.infinity,
                  padding: 10,
                  onPressed: () {
                  
                  },
                  title: "Done",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    return DateFormat.MMMM().format(DateTime(DateTime.now().year, month, 1));
  }

  int _getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  Color _getColorForDate(DateTime date, CommonElementsViewModel model) {
    if (model.selectedStartDate == date) {
      return UiColor.primaryColor;
    } else if (model.selectedEndDate != null && date.isAfter(model.selectedStartDate) && date.isBefore(model.selectedEndDate!.add(const Duration(days: 1)))) {
      return UiColor.primaryColor.withOpacity(0.5);
    } else if (model.selectedDate == date) {
      // Previously selected dates
      return UiColor.primaryColor.withOpacity(0.5);
    } else {
      // Default color
      return Colors.transparent;
    }
  }
}
