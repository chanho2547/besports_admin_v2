import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;

  const CustomButton({
    super.key,
    required this.title,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final Color onPressedColor = Colors.blueGrey.shade800;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(8.0), // set the border radius to 8.0
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          color: Colors.blueGrey,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
