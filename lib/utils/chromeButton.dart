import 'package:flutter/material.dart';

import '../constants.dart';

class ChromeButton extends StatelessWidget {
  const ChromeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 0,
            backgroundColor: softBlue,
          ),
          child: const Text(
            "Get it on Chrome",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
