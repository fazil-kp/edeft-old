import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/const/color.dart';
import 'package:edeft/models/report_card_model.dart';
import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final ReportCardModel model;
  final double? width;
  const CustomCard({Key? key, required this.model, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (ResponsiveHelpers.isDesktop(context) ? 210 : 100),
      height: ResponsiveHelpers.isDesktop(context) ? 140 : 100,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1)),
        child: Padding(
          padding: EdgeInsets.all(ResponsiveHelpers.isDesktop(context) ? 20.0 : 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title ?? "", style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: ResponsiveHelpers.isDesktop(context) ? 15 : 10, fontWeight: FontWeight.w900)),
              Text(model.count ?? "0",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: model.isCountWord
                          ? ResponsiveHelpers.isDesktop(context)
                              ? 16
                              : 10
                          : 25,
                      color: model.color != null ? UiColors.hexToColor(model.color ?? "#00000") : UiColor.primaryColor)),
              // Subtile
              SizedBox(height: ResponsiveHelpers.isDesktop(context) ? 10 : 0),
              if (model.subtitle != null)
                Row(
                  children: [
                    SizedBox(width: ResponsiveHelpers.isDesktop(context) ? 140 : 60, child: Text(model.subtitle ?? "", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: ResponsiveHelpers.isDesktop(context) ? 12 : 7, color: UiColor.extraDarkGreyColor))),
                    SizedBox(width: ResponsiveHelpers.isDesktop(context) ? 5 : 0),
                    Icon(Icons.arrow_upward, color: Colors.green, size: ResponsiveHelpers.isDesktop(context) ? 15 : 8),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
