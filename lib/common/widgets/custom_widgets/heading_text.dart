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
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.w400,fontFamily: "OpenSans"),
    );
  }
}
class BodyText extends StatelessWidget {
  final String? body_text;
  const BodyText({

    this.body_text,


  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(body_text ?? " ",style: TextStyle(color: Colors.white,fontFamily: "Opensans",fontSize: 16,fontWeight: FontWeight.normal),);
  }
  
}