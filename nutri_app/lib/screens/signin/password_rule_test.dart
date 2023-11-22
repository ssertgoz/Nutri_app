import 'package:flutter/material.dart';

class PasswordRuleText extends StatelessWidget {
  final String text;
  final bool checked;
  const PasswordRuleText({Key? key, required this.text, required this.checked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: checked
              ? Icon(
                  Icons.check_rounded,
                  size: height * 0.02,
                )
              : const Text(
                  "•",
                  style: TextStyle(color: Colors.black87),
                ),
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
