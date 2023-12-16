import 'package:edeft/common_elements/button.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertBox {
  static showAlert(
    BuildContext context, {
    required String title,
    required String message,
    required String fistButtonTitle,
    String? secondButtonTitle,
    Function? onFirstButtonPressed,
    Function? onSecondButtonPressed,
    ButtonType firstButtonType = ButtonType.negative,
    ButtonType secondButtonType = ButtonType.secondary,
    double height = 300,
    Widget? child,
    Color backDropColor = Colors.black87,
    Duration transitionDuration = const Duration(milliseconds: 120),
    Function? onDismissed,
    Function? customHapticFeedback,
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
            height: message.length > 80
                ? ResponsiveHelpers.isDesktop(context)
                    ? height + 100
                    : height + 50
                : height,
            margin: EdgeInsets.symmetric(horizontal: (ResponsiveHelpers.isMobile(context)) ? ResponsiveHelpers.width(context) * 0.08 : ResponsiveHelpers.width(context) * 0.35),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10, offset: const Offset(0, 10))]),
            child: SizedBox.expand(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 22 : 25, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 350,
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (child != null) child,
                  const SizedBox(height: 30),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: (secondButtonTitle != null && secondButtonTitle != "") ? 10 : 10,
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Visibility(
                            visible: (secondButtonTitle == null || secondButtonTitle == ""),
                            maintainState: false,
                            child: const SizedBox(
                              height: 20,
                            ),
                          ),
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
                              width: double.infinity,
                              buttonType: firstButtonType,
                            ),
                          ),
                          Visibility(
                            visible: (secondButtonTitle == null || secondButtonTitle == ""),
                            maintainState: false,
                            child: const Spacer(),
                          ),
                          Visibility(visible: (secondButtonTitle != null && secondButtonTitle != ""), maintainState: false, child: const SizedBox(height: 10)),
                          Visibility(
                              visible: (secondButtonTitle != null && secondButtonTitle != ""),
                              maintainState: false,
                              child: Expanded(
                                  child: Button(
                                padding: 10,
                                title: secondButtonTitle,
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  if (onSecondButtonPressed != null) {
                                    onSecondButtonPressed();
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                width: double.infinity,
                                buttonType: secondButtonType,
                                textStyle: const TextStyle(color: Colors.black),
                              ))),
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
                  )
                ],
              ),
            ),
          )),
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

  static showCustomDialog(
    BuildContext context, {
    double height = 500,
    Widget? child,
    Color backDropColor = Colors.black87,
    Duration transitionDuration = const Duration(milliseconds: 120),
    Function? onDismissed,
    Function? customHapticFeedback,
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
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10, offset: const Offset(0, 10))]),
              child: SizedBox.expand(
                child: Padding(padding: const EdgeInsets.all(10.0), child: child),
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
