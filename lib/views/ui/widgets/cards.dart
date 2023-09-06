// this use to see what is change of price for gold and metal
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

Widget cardWidget({
  required String leading,
  required String price,
  required String unitMetal,
  required String changePriceOfMetal,
  required IconData icon,
  required Color iconColor,
  required String karat,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      boxShadow: const [
        BoxShadow(
          color: Color(0xFFDAB906),
          spreadRadius: -3.9,
          offset: Offset(0, 2.5),
        ),
      ],
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      // shadowColor: Color(0xffDAB906),
      elevation: 5,
      child: ListTile(
        leading: Image.asset(
          leading,
          scale: 1.5,
        ),
        title: Text(
          price.toUpperCase(),
          textAlign: TextAlign.left,
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          wordSpacing: 5.sp,
          color: Colors.black,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              karat.toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '/${unitMetal.toUpperCase()}',
              style: const TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        subtitleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13.sp,
        ),
        trailing: Wrap(
          direction: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Change',
                    style: TextStyle(
                      color: pGoldColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FittedBox(
                      child: Icon(
                        icon,
                        color: iconColor,
                        size: 16.sp,
                      ),
                    ),
                    Text(
                      changePriceOfMetal,
                      style: TextStyle(
                        color: pTextMoveUpColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
