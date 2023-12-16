import 'package:edeft/common_elements/custom_avatar/helpers/custom_avatar_helpers.dart';
import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:flutter/material.dart';


class CustomCircleAvatar extends StatelessWidget {
  final Color? color;
  final String? name;
  final double? radius;

  const CustomCircleAvatar({super.key, this.color, this.name, this.radius});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? (ResponsiveHelpers.isDesktop(context)?30:20),
      backgroundColor: color ?? CustomAvatarHelper.getRandomColor(name!),
      child: Text(
        CustomAvatarHelper.getInitials(name ?? ""),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
