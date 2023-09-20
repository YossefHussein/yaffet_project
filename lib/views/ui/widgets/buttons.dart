// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class GradientButtonWidget extends StatelessWidget {
  Gradient gradient;
  double? width;
  double? height;
  GestureTapCallback? onPressed;
  String text;
  bool? isUpperCase;
  Color? color;

  GradientButtonWidget({
    super.key,
    required this.gradient,
    this.width = 86.26,
    this.height = 28.27,
    required this.onPressed,
    required this.text,
    this.isUpperCase = false,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        width: 86.26,
        height: 28.27,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(
            10.0,
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
}

class ElevatedButtonWidget extends StatelessWidget {
  String? name;
  VoidCallback? onPressed;
  double height;
  double? width;
  Color color;
  Color colorText;
  Color borderColor;
  double borderSide;
  FontWeight? fontWeight;
  double? textSize;
  double borderRadius;
  double paddingButton;

  ElevatedButtonWidget({
    super.key,
    required this.name,
    required this.onPressed,
    this.height = 34,
    this.width = 96,
    this.color = const Color(0xFF505F6D),
    this.colorText = const Color(0xFFFFFFFF),
    this.borderColor = Colors.transparent,
    this.borderSide = 0,
    this.fontWeight = FontWeight.w700,
    this.textSize = 15,
    this.borderRadius = 15,
    this.paddingButton = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.spMax,
      width: width?.spMax,
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
            child: Text(name!),
          ),
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  String title;
  VoidCallback? onPressed;
  bool isUpperCase;
  double height;
  double width;
  Color? color;
  double paddingBottom;
  double paddingLeft;
  double paddingRight;
  double paddingTop;
  bool? isActive;

  TextButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.isUpperCase = true,
    this.height = 32,
    this.width = 40,
    this.color = const Color(0xFFD7B606),
    this.paddingBottom = 9,
    this.paddingLeft = 9,
    this.paddingRight = 9,
    this.paddingTop = 7,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
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
}
