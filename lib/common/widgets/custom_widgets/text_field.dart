import 'package:flutter/material.dart';

class TextFld extends StatefulWidget {
  final String? lblText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? sfxicon;
  final bool obText;
  final String? errortext;
  final TextEditingController? controller_name;

  const TextFld({
    super.key,
    this.hintText,
    this.lblText,
    this.prefixIcon,
    this.sfxicon,
    this.obText = false,
    this.errortext = "This Field is Required",
    this.controller_name,
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
      controller: widget.controller_name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errortext;
        }
        return null;
      },
      obscureText: _obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
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
