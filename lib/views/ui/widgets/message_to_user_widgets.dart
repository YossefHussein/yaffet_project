// if the text field is empty send message to use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../styles/colors.dart';

textFieldIsEmptyMessage() => Fluttertoast.showToast(
      msg: 'text field is empty',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: pGoldColor,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );
