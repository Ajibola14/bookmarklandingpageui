import 'package:flutter/material.dart';

import '../constants.dart';

class FireFoxButton extends StatelessWidget {
  const FireFoxButton({
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
            elevation: 3,
            backgroundColor: Colors.white60,
          ),
          child: Text(
            "Get it on Firefox",
            style: TextStyle(color: darkBlue),
          )),
    );
  }
}
