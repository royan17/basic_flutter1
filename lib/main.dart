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
            calculationResult =
                int.parse(etInput.text) + 273.15;
            break;
          case 'Reaumur':
            calculationResult =
                int.parse(etInput.text) * 4 / 5;
            break;
          case 'Fahrenheit':
            calculationResult =
                (int.parse(etInput.text) * 9 / 5) + 32;
            break;
        }
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
            TextField(
              controller: etInput,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter the temperature in celcius',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            DropdownButton(
                isExpanded: true,
                value: selectedDropdown,
                items: listTemperature.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    onDropdownChange(value);
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$calculationResult',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temperatureConversion();
                      });
                    },
                    child: const Text('Konversi Suhu'),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text('Riwayat Konversi', style: TextStyle(fontSize: 20)),
          ]),
        ),
      ),
    );
  }
}
