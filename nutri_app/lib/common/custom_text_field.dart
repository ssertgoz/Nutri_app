import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function onChange;
  final TextEditingController controller;
  const CustomtextField(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.onChange,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
        Container(
          height: height * 0.065,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            onChanged: (value) {
              onChange();
            },
            onTapOutside: (value) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
          ),
        )
      ],
    );
  }
}
