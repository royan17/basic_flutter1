import 'package:flutter/material.dart';

class PerhitunganTerakhir extends StatelessWidget {
  const PerhitunganTerakhir({
    Key? key,
    required this.calculationResult,
  }) : super(key: key);

  final double calculationResult;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$calculationResult',
      style: const TextStyle(fontSize: 32),
    );
  }
}
