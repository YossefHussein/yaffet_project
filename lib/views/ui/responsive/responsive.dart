import 'package:flutter/material.dart';

// this class for if thing want to responsive
// can provider the UI tablet and mobile
class Responsive extends StatefulWidget {
  final Widget tabletUi;
  final Widget mobileUi;
  const Responsive({
    super.key,
    required this.mobileUi,
    required this.tabletUi,
  });

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 500) {
          return widget.mobileUi;
        } else {
          return widget.tabletUi;
        }
      },
    );
  }
}
