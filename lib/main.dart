import 'package:basic_flutter/widget/InputTemperature.dart';
import 'package:basic_flutter/widget/KonversiTemperature.dart';
import 'package:basic_flutter/widget/PerhitunganTerakhir.dart';
import 'package:basic_flutter/widget/RiwayatPerhitungan.dart';
import 'package:basic_flutter/widget/TargetPerhitungan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  List<String> listTemperature = ['Kelvin', 'Reaumur', 'Fahrenheit'];
  String selectedDropdown = 'Kelvin';
  double calculationResult = 0.0;
  List<String> listResult = [];

  void onDropdownChange(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  void temperatureConversion() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case 'Kelvin':
            calculationResult = int.parse(etInput.text) + 273.15;
            break;
          case 'Reaumur':
            calculationResult = int.parse(etInput.text) * 4 / 5;
            break;
          case 'Fahrenheit':
            calculationResult = (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
        listResult.add(
            'Konversi dari ${etInput.text} celcius ke ${selectedDropdown} dengan hasil : ${calculationResult.toString()}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Converter Suhu ')),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(children: [
            InputTemperature(etInput: etInput),
            const SizedBox(height: 8),
            TargetPerhitungan(selectedDropdown: selectedDropdown, listTemperature: listTemperature, onDropChanged: onDropdownChange,),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            PerhitunganTerakhir(calculationResult: calculationResult),
            const SizedBox(
              height: 10,
            ),
            KonversiTemperature(onPressed: temperatureConversion,),
            const SizedBox(height: 10),
            const Text('Riwayat Konversi', style: TextStyle(fontSize: 20)),
            RiwayatPerhitungan(listResult: listResult),
          ]),
        ),
      ),
    );
  }
}
