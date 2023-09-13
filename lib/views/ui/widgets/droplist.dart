// this shadow of the container
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

// Widget dropListWidget({
//   required BuildContext context,
//   required String? value,
//   required List<DropdownMenuItem<String>>? items,
//   required ValueChanged<String?>? onChange,
//   bool isExpanded = true,
//   double height = 19.55,
//   double width = 190,
// }) =>
//     Container(
//       width: width.spMin,
//       height: height.spMin,
//       // margin: const EdgeInsets.only(
//       //   top: 5.0,
//       //   right: 15.0,
//       //   bottom: 5.0,
//       //   left: 15.0,
//       // ),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: pColorDropList,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 0.5,
//             blurRadius: 1,
//             offset: const Offset(0, 0.5),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: DropdownButton(
//         alignment: Alignment.center,
//         isExpanded: isExpanded,
//         underline: Container(
//           color: Colors.transparent,
//         ),
//         icon: const Icon(
//           Icons.arrow_drop_down_rounded,
//           color: pColorIconDropList,
//         ),
//         borderRadius: BorderRadius.circular(10),
//         value: value,
//         items: items,
//         onChanged: (String? newValue) {
//           onChange!(newValue);
//         },
//       ),
//     );




class DropListWidget extends StatelessWidget {
  
  BuildContext? context;
  String? value;
  List<DropdownMenuItem<String>>? items;
  ValueChanged<String?>? onChange;
  bool isExpanded = true;
  double? height = 19.55;
  double? width = 190;

  DropListWidget({
    super.key,
    required this.context,
    required this.value,
    required this.items,
    required this.onChange,
    this.isExpanded = true,
    this.height = 19.55,
    this.width = 190,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: width?.spMin,
        height: height?.sp,
        // margin: const EdgeInsets.only(
        //   top: 5.0,
        //   right: 15.0,
        //   bottom: 5.0,
        //   left: 15.0,
        // ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: pColorDropList,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: const Offset(0, 0.5),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButton(
          alignment: Alignment.center,
          isExpanded: isExpanded,
          underline: Container(
            color: Colors.transparent,
          ),
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: pColorIconDropList,
          ),
          borderRadius: BorderRadius.circular(10),
          value: value,
          items: items,
          onChanged: (String? newValue) {
            onChange!(newValue);
          },
        ),
      );
}
