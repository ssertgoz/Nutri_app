import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final void Function(T?) onChanged;
  final String? hint;

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  CustomDropdownButtonState<T> createState() => CustomDropdownButtonState<T>();
}

class CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  T? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<T>(
                icon: Container(),
                underline: Container(),
                value: _selectedItem ??
                    (widget.hint == null ? widget.items.first : null),
                items: widget.items
                    .map((item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(item.toString()),
                        ))
                    .toList(),
                hint: widget.hint != null
                    ? Text(
                        widget.hint!,
                        style: TextStyle(color: Colors.grey.shade400),
                      )
                    : null,
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                  widget.onChanged(value);
                },
              ),
            ),
            const Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }
}
