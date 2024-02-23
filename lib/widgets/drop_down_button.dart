import 'package:ecommerce/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDown extends StatefulWidget {
  String dropDownValue;
  List<String> items;
  final Function(String) onChanged;

  DropDown({
    super.key,
    required this.dropDownValue,
    required this.items,
    required this.onChanged,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return DropdownButton(
          // Initial Value
          value: widget.dropDownValue.isNotEmpty || widget.dropDownValue != null
              ? widget.dropDownValue
              : "",

          // Down Arrow Icon
          icon: const Icon(Icons.keyboard_arrow_down),

          // Array list of items
          items: widget.items.isNotEmpty || widget.items != null
              ? widget.items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList()
              : null,
          onChanged: (String? newValue) {
            if (widget.items.isNotEmpty || widget.items != null) {
              widget.dropDownValue = newValue!;
              widget.onChanged(newValue);
              print("${widget.dropDownValue} is Selected");
            } else {
              widget.items = ["1", "2"];
            }
            setState(() {});
          },
        );
      },
    );
  }
}
