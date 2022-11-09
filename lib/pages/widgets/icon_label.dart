import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {

  final String label;
  final IconData icon;

  const IconLabel({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
