// default form in app
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

Widget formFieldWidget({
  required controller,
  double height = 19.55,
  double width = 190,
  double borderRadius = 0,
  String? labelText,
  bool isPassword = false,
  FormFieldValidator<String>? validMsg,
  ValueChanged<String>? onSubmits,
  ValueChanged<String>? onChanged,
  TextInputType? type = TextInputType.number,
}) =>
    Container(
      height: height.sp,
      width: width.spMin,
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
