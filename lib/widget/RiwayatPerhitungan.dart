import 'package:flutter/material.dart';

class RiwayatPerhitungan extends StatelessWidget {
  const RiwayatPerhitungan({
    Key? key,
    required this.listResult,
  }) : super(key: key);

  final List<String> listResult;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: listResult.length,
        itemBuilder: (context, index) {
          return Text(listResult[index]);
        },
      ),
    );
  }
}
