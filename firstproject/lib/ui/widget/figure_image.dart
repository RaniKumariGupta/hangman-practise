import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget figureImage(bool visible, String path) {
  return Visibility(
      visible: visible,
      child: Container(
        width: 250,
        height: 250,
        child: Image.asset(path),
      ).animate().fade());
}
