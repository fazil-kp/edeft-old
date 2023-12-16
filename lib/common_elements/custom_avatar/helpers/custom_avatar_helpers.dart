import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';

class CustomAvatarHelper {
  //* For Circle Avatar Widget
  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String initials = "";

    for (String s in nameSplit) {
      if (s.isNotEmpty) {
        initials += s[0];
      }
    }

    if (initials.length > 1) {
      return initials.substring(0, 2).toUpperCase();
    } else {
      return initials.toUpperCase();
    }
  }

  static Color getRandomColor(String name) {
    // Use the hash value of the UTF-8 encoded name to generate a color
    final hash = utf8.encode(name);
    final hashValue = hash.fold<int>(0, (previous, element) => previous + element).abs() % (256 * 256 * 256);
    final r = hashValue % 256;
    final g = (hashValue ~/ 256) % 256;
    final b = (hashValue ~/ (256 * 256)) % 256;
    return Color.fromARGB(255, r, g, b);
  }
}
