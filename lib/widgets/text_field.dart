import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.icon,
    required this.labelText,
    required this.onSaved,
    this.keyboardType,
  });
  final labelText;
  final String hintText;
  final IconData icon;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,

      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
      ), // Change text color
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontFamily: 'Montserrat',
        ), // Label color
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white54,
          fontFamily: 'Montserrat',
        ), // Hint color
        filled: true,
        fillColor: Colors.black26, // Field background color
        suffixIcon: Icon(icon, color: Colors.white54), // Person icon at the end
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.secondary,
            width: 2,
          ), // Focus border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.secondary,
            width: 1,
          ), // Default border color
        ),
      ),
    );
  }
}
