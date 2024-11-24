import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String? txt;

  const HeadingText({
    super.key,
    this.txt,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Text(
      txt ?? " ",
      style: const TextStyle(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
    );
  }
}
