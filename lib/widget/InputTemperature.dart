import 'package:flutter/material.dart';

class InputTemperature extends StatelessWidget {
  const InputTemperature({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: etInput,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Celcius',
        hintText: 'Enter the temperature in celcius',
      ),
      onChanged: (value) {},
    );
  }
}
