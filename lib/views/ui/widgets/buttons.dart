import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

Widget gradientButtonWidget({
  required Gradient gradient,
  double width = 86.26,
  double height = 28.27,
  required GestureTapCallback? onPressed,
  required String text,
  bool isUpperCase = false,
  double borderRadius = 10.0,
  Color? color = Colors.transparent,
}) {
  return GestureDetector(
    onTap: () {
      onPressed!();
    },
    child: Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Center(
        child: Text(
          isUpperCase == true ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}

Widget elevatedButton({
  required String name,
  required VoidCallback? onPressed,
  double height = 34,
  double width = 96,
  Color color = const Color(0xFF505F6D),
  Color colorText = const Color(0xFFFFFFFF),
  Color borderColor = Colors.transparent,
  double borderSide = 0,
  FontWeight fontWeight = FontWeight.w700,
  double textSize = 15,
  double borderRadius = 15,
  double paddingButton = 0,
}) {
  return Container(
    height: height.spMax,
    width: width.spMax,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: borderColor,
          width: borderSide,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: color,
        textStyle: TextStyle(
          color: colorText,
          fontWeight: fontWeight,
          fontSize: textSize,
        ),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Padding(
        padding: EdgeInsets.all(paddingButton),
        child: FittedBox(
          child: Text(name),
        ),
      ),
    ),
  );
}

Widget textButtonWidget({
  required String title,
  required VoidCallback? onPressed,
  bool isUpperCase = true,
  double height = 32,
  double width = 40,
  Color color = const Color(0xFFD7B606),
  double paddingBottom = 9,
  double paddingLeft = 9,
  double paddingRight = 9,
  double paddingTop = 7,
  bool isActive = false,
}) {
  return Container(
    height: height.spMax,
    width: width.spMax,
    child: TextButton(
      onPressed: () {
        onPressed!();
      },
      style: TextButton.styleFrom(
        backgroundColor: isActive == false ? Colors.white : color,
        side: const BorderSide(
          color: pGoldColor,
          width: 2,
        ),
        padding: EdgeInsets.only(
          bottom: paddingBottom,
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
        ),
        shape: const CircleBorder(),
      ),
      child: FittedBox(
        child: Text(
          isUpperCase ? title.toUpperCase() : title,
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w600,
            color: isActive == false ? color : Colors.white,
          ),
        ),
      ),
    ),
  );
}
