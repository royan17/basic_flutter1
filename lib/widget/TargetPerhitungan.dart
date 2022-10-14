import 'package:flutter/material.dart';

class TargetPerhitungan extends StatelessWidget {
  const TargetPerhitungan({
    Key? key,
    required this.selectedDropdown,
    required this.listTemperature,
    required this.onDropChanged,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listTemperature;
  final Function onDropChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDropdown,
      items: listTemperature.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropChanged(value);
      },
    );
  }
}
