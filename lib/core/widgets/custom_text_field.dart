import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.isPassword = false,
      this.controller})
      : super(key: key);

  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  bool? isPassword;
  Function(String)? onChanged;
  TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field can\'t be impty';
        }
        return null;
      },
      obscureText: widget.isPassword!,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {});
            if (widget.hintText != 'Email') {
              if (widget.isPassword!) {
                widget.isPassword = false;
              } else {
                widget.isPassword = true;
              }
            }
          },
          icon: isFieldText(),
        ),
        fillColor: const Color(0xff1D1F21),
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 16, top: 21, bottom: 21),
          child: Icon(
            widget.prefixIcon,
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget isFieldText() {
    if (widget.hintText == 'Email') {
      return const Text('');
    } else {
      return Icon(
        widget.isPassword == true ? Icons.visibility_off : Icons.visibility,
        color: Colors.white,
      );
    }
  }
}
