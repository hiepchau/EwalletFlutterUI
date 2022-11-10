import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final String label;
  final IconData icon;

  const IconLabel({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.blue,
                size: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: constraints.maxWidth,
                child: Center(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.headlineSmall
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
