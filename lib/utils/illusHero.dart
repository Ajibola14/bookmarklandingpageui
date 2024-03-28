import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class IllustrationHero extends StatelessWidget {
  const IllustrationHero({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: CustomPaint(
          painter: Illus1Painter(),
          child: Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              "assets/images/illustration-hero.svg",
              width: double.infinity * 0.8,
            ),
          )),
    );
  }
}

class Illus1Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = softBlue;
    Path path = Path();
    path.moveTo(size.width, size.height * 0.25);
    path.lineTo(size.width * 0.4, size.height * 0.25);
    path.cubicTo(size.width * 0.4, size.height * 0.25, size.width * 0.1,
        size.height * 0.625, size.width * 0.4, size.height);

    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
