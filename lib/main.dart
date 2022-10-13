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
  List<String> listTemperature = ['Kelvin', 'Reamur', 'Fahrenheit'];

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
              decoration: const InputDecoration(
                labelText: 'Celcius',
                hintText: 'Enter the temperature in celcius',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            DropdownButton(
                isExpanded: true,
                value: 'Fahrenheit',
                items: listTemperature.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {}),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Hasil',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '356',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
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
