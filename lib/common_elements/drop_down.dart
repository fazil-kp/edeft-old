import 'package:edeft/common_elements/responsive_helpers.dart';
import 'package:edeft/const/color.dart';
import 'package:edeft/models/dropdown_model.dart';
import 'package:flutter/material.dart';



class CustomDropDown extends StatelessWidget {
  final void Function(dynamic)? onChange;
  final String? hint;
  final IconData? icon;
  final List<DropDownModel>? dropDownItems;
  final bool isForm;
  final String? selectedValue;

  const CustomDropDown({super.key, this.onChange, this.hint, this.dropDownItems, this.icon, this.isForm = false, this.selectedValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (ResponsiveHelpers.isMobile(context)) ? 40 : 45,
      decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: UiColor.greyColor, width: 2)), borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: DropdownButton(
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(hint ?? "", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: isForm ? Colors.black : UiColor.primaryTextColor.withOpacity(.3), fontSize: isForm ? 14 : 16, fontWeight: FontWeight.w400)),
          ),
          underline: Container(),
          dropdownColor: Colors.white,
          elevation: 1,
          value: selectedValue,
          borderRadius: BorderRadius.circular(12),
          icon: Padding(padding: const EdgeInsets.only(right: 10), child: Icon(icon ?? Icons.keyboard_arrow_down, color: isForm ? Colors.black : UiColor.primaryTextColor.withOpacity(.3))),
          items: dropDownItems?.map<DropdownMenuItem<String>>(
            (DropDownModel item) {
              return DropdownMenuItem<String>(
                value: item.value,
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedValue == item.value,
                      onChanged: (s) {},
                      activeColor: UiColor.successColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(color: UiColor.greyColor),
                    ),
                    Text(
                      item.title ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: UiColor.primaryTextColor.withOpacity(.3), fontSize: 16, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              );
            },
          ).toList(),
          onChanged: onChange),
    );
  }
}
