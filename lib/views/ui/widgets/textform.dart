// default form in app
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class FormFieldWidget extends StatelessWidget {

  dynamic? controller;
  double? height;
  double? width;
  double? borderRadius;
  String? labelText;
  bool? isPassword;
  FormFieldValidator<String>? validMsg;
  ValueChanged<String>? onSubmits;
  ValueChanged<String>? onChanged;
  TextInputType? type = TextInputType.number;

  FormFieldWidget({
    super.key,
    required this.controller,
    this.height = 19.55,
    this.width = 190,
    this.borderRadius = 0,
    this.labelText,
    this.isPassword = false,
    this.validMsg,
    this.onSubmits,
    this.onChanged,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.sp,
      width: width?.spMin,
      alignment: Alignment.center,
      // padding: const EdgeInsets.symmetric(vertical: 2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: pColorDropList,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 1.5),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmits,
        onChanged: onChanged,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          // contentPadding:
          //     const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 12.spMin,
          ),
        ),
        validator: validMsg,
      ),
    );
  }
}
