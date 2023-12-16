import 'package:edeft/common_elements/button.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/common_elements/text_input_felid.dart';
import 'package:edeft/const/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPopUp {
  static showForm(
    BuildContext context, {
    required String title,
    IconData? secondButtonIcon,
    required String message,
    required String fistButtonTitle,
    Function? onFirstButtonPressed,
    Function? onSecondButtonPressed,
    ButtonType firstButtonType = ButtonType.primary,
    ButtonType secondButtonType = ButtonType.secondary,
    double height = 500,
    Widget? child,
    Color backDropColor = Colors.black54,
    Duration transitionDuration = const Duration(milliseconds: 120),
    Function? onDismissed,
    Function? customHapticFeedback,
    List<TextEditingController>? textInputController,
    List<String>? hintText,
    num? length,
    bool? isImage = true,
  }) {
    Future.delayed(const Duration(milliseconds: 100), () => customHapticFeedback != null ? customHapticFeedback() : HapticFeedback.lightImpact());
    showGeneralDialog(
      barrierLabel: 'Alert',
      barrierDismissible: true,
      barrierColor: backDropColor,
      transitionDuration: transitionDuration,
      useRootNavigator: true,
      context: context,
      pageBuilder: (_, __, ___) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              height: height,
              margin: EdgeInsets.symmetric(horizontal: (ResponsiveHelpers.isMobile(context)) ? ResponsiveHelpers.width(context) * 0.08 : ResponsiveHelpers.width(context) * 0.35),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                )
              ]),
              child: SizedBox.expand(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(title, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 22 : 30, fontWeight: FontWeight.bold, color: Colors.black)),
                      SizedBox(width: ResponsiveHelpers.isMobile(context) ? ResponsiveHelpers.width(context) * 0.8 : ResponsiveHelpers.width(context) * 0.3, child: Text(message, style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15), textAlign: TextAlign.start)),
                      const SizedBox(height: 20),
                      for (int i = 0; i < (length ?? 4); i++)
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            CustomTextInput(hintText: hintText?[i], controller: textInputController?[i]),
                          ],
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (child != null) child,
                      isImage == true
                          ? Expanded(
                              child: Container(
                                  decoration: BoxDecoration(color: UiColor.greyColor, borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(CupertinoIcons.photo_fill, color: Colors.black),
                                      SizedBox(width: 10),
                                      Text("Add Image"),
                                    ],
                                  )))
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Button(
                              padding: 10,
                              title: fistButtonTitle,
                              textStyle: firstButtonType == ButtonType.secondary ? const TextStyle(color: Colors.black) : null,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                if (onFirstButtonPressed != null) {
                                  onFirstButtonPressed();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              width: secondButtonIcon == null ? double.infinity : ResponsiveHelpers.width(context) * 0.45,
                              buttonType: firstButtonType,
                            ),
                          ),
                          if (secondButtonIcon != null)
                            const SizedBox(
                              width: 20,
                            ),
                          if (secondButtonIcon != null)
                            EdeftIconButton(
                              icon: secondButtonIcon,
                              iconColor: Colors.black,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                if (onSecondButtonPressed != null) {
                                  onSecondButtonPressed();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              buttonType: secondButtonType,
                            ),
                        ],
                      ),
                      ResponsiveHelpers.isDesktop(context)
                          ? const SizedBox(
                              height: 20,
                            )
                          : const SizedBox(
                              height: 0,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim, secondaryAnimation, child) {
        final tween = Tween<double>(begin: 0.85, end: 1.0);
        anim = tween.animate(anim);
        anim = CurvedAnimation(parent: anim, curve: Curves.fastOutSlowIn);

        return ScaleTransition(
          scale: anim,
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
