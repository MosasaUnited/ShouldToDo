import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton(
      {super.key, required this.value, required this.onToggle});

  final bool value;
  final Function(bool) onToggle;

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    isSelected = widget.value;
  }

  void toggle() {
    setState(() {
      isSelected = !isSelected;
      widget.onToggle(isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        width: 50.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(isSelected ? 'Light' : 'Dark'),
          ],
        ),
      ),
    );
  }
}
