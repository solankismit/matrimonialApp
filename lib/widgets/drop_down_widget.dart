import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> items;
  final String hintText;
  String? selectedValue;

  DropDownWidget({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.hintText,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String holder = "";
  void getDropDownItem() {
    setState(() {
      holder = widget.selectedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: DropdownButton(
        underline: Container(
          height: 2,
          color: Color(0xfffeadad),
        ),
        hint: Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        isExpanded: true,
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Column(
                    children: [
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      // Divider()
                    ],
                  ),
                ))
            .toList(),
        onChanged: (String? value) {
          if (value is String) {
            setState(() {
              widget.selectedValue = value;
              print(value);
            });
          }
        },
        value: widget.selectedValue,
      ),
    );
  }
}
