import 'package:edeft/common_elements/button.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/const/color.dart';
import 'package:flutter/material.dart';

Widget popUpHeader(BuildContext context, {required String title, String? subtitle, required Function() onClose}) {
  return Padding(
    padding: ResponsiveHelpers.isMobile(context) ? const EdgeInsets.only(top: 10, left: 8.0, right: 20, bottom: 0.0) : const EdgeInsets.only(top: 10.0, left: 8.0, right: 0, bottom: 0.0),
    child: Row(
      children: [
        SizedBox(
          width: ResponsiveHelpers.isMobile(context) ? 200 : 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 20 : 25, fontWeight: FontWeight.bold, color: UiColor.extraDarkGreyColor)),
              SizedBox(width: ResponsiveHelpers.isMobile(context) ? ResponsiveHelpers.width(context) * 0.8 : ResponsiveHelpers.width(context) * 0.3, child: Text(subtitle ?? "", style: TextStyle(color: UiColor.darkGreyColor, fontSize: 12), textAlign: TextAlign.start)),
            ],
          ),
        ),
        const Spacer(),
        EdeftIconButton(
            icon: Icons.close,
            onPressed: () {
              onClose();
              Navigator.pop(context);
            },
            iconColor: Colors.black),
      ],
    ),
  );
}
