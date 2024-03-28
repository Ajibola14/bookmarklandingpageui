import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class ExtensionContainer extends StatelessWidget {
  ExtensionContainer(
    this.logo,
    this.name,
    this.ver, {
    super.key,
  });
  String logo;
  String name;
  String ver;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1)
          ]),
      child: Column(children: [
        SvgPicture.asset(logo),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Add to $name",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: darkBlue),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Minimum version $ver",
          style: TextStyle(fontSize: 18, color: grayishBlue),
        ),
        const SizedBox(height: 10),
        SvgPicture.asset(
          "assets/images/bg-dots.svg",
        ),
        const SizedBox(height: 15),
        FittedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: softBlue),
              onPressed: () {},
              child: const Text(
                "Add & Install Extension",
                style: TextStyle(color: Colors.white),
              )),
        )
      ]),
    );
  }
}
