import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class DisplayNameWidget extends StatefulWidget {
  const DisplayNameWidget({
    super.key,
    required this.isLoginSelected,
    required this.title,
  });
  final bool isLoginSelected;
  final String title;

  @override
  State<DisplayNameWidget> createState() =>
      _DisplayNameWidgetState();
}

class _DisplayNameWidgetState extends State<DisplayNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight:
                widget.isLoginSelected ? FontWeight.bold : FontWeight.normal,
            color: widget.isLoginSelected ? Colors.white70 : Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        widget.isLoginSelected == true
            ? Container(
              height: 2,
              width: 90,
              color:
                  widget.isLoginSelected
                      ? AppColors.secondary
                      : Colors.transparent,
            )
            : Container(
              height: 2,
              width: 50,
              color:
                  widget.isLoginSelected
                      ? AppColors.secondary
                      : Colors.transparent,
            ),
      ],
    );
  }
}
