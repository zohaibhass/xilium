import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String? name;
  final TextStyle? styling;
  final VoidCallback? callback;
  final Color? backgroundColor;
  const LargeButton(
      {super.key,
      this.name,
      this.styling,
      this.callback,
      this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(backgroundColor ?? Colors.blue),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Fixed border radius
              ),
            ),
          ),
          child: Text(
            name ?? " ",
            style: styling,
          )),
    );
  }
}
