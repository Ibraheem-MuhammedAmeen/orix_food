import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class AddSubWidget extends StatefulWidget {
  const AddSubWidget({super.key, required this.icon, required this.onTap});

  final IconData? icon;
  final void Function()? onTap;
  @override
  State<AddSubWidget> createState() => _AddSubWidgetState();
}

class _AddSubWidgetState extends State<AddSubWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(widget.icon, size: 15),
      ),
    );
  }
}
