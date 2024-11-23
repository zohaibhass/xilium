import 'package:flutter/material.dart';

class TextFld extends StatefulWidget {
  final String? lblText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sfxicon;
  final bool obText;

  const TextFld({
    super.key,
    this.hintText,
    this.lblText,
    this.prefixIcon,
    this.sfxicon,
    this.obText = false,
  });

  @override
  State<TextFld> createState() => _TextFldState();
}

class _TextFldState extends State<TextFld> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obText; // Initialize with the passed `obText` value
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.lblText ?? "",
        hintText: widget.hintText ?? "",
        hintStyle: const TextStyle(color: Color(0xffDADADA)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffdadada)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffdadada)),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.sfxicon,
      ),
    );
  }
}
