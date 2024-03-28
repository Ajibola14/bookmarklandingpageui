import 'package:flutter/material.dart';

import '../constants.dart';
class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
            backgroundColor: softBlue),
        child: const Text(
          "More Info",
          style: TextStyle(color: Colors.white),
        ));
  }
}
