import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/const/color.dart';
import 'package:flutter/material.dart';


class CustomDataTable extends StatelessWidget {
  final List<Map<String, dynamic>> dataTableData;

  const CustomDataTable({super.key, required this.dataTableData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        title: SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header
              if (dataTableData.isNotEmpty)
                Row(
                  children: [
                    for (int i = 0; i < dataTableData[0].length; i++)
                      SizedBox(
                        width: MediaQuery.of(context).size.width <= 786 ? 110 : 220,
                        child: Text(
                          dataTableData[0].keys.toList()[i].toString().toUpperCase(),
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: ResponsiveHelpers.isDesktop(context) ? 15 : 12,
                                fontWeight: FontWeight.w600,
                                color: UiColor.darkGreyColor,
                              ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(
                height: 10,
              ),
            
              // Loop for data each row.
              for (int i = 0; i < dataTableData.length; i++)
                Column(
                  children: [
                    Divider(
                      thickness: 1,
                      color: UiColor.greyColor,
                    ),
                    Row(
                      children: [
                        for (int j = 0; j < dataTableData[i].length; j++)
                          SizedBox(
                            width: MediaQuery.of(context).size.width <= 786 ? 110 : 220,
                            child: Text(
                              dataTableData[i].values.toList()[j].toString(),
                              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    fontSize: ResponsiveHelpers.isDesktop(context) ? 13 : 11,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black,
                                  ),
                            ),
                          ) // Header // Header
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
