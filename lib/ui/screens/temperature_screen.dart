import 'package:flutter/material.dart';

class TemperatureScreen extends StatelessWidget {
  final VoidCallback buttonPress;
  TemperatureScreen({super.key, required this.buttonPress});

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // IconButton(onPressed: buttonPress, Text: Icon(Icons.arrow_back, ))
                TextButton(onPressed: buttonPress, child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white,),
                    Text("Back to Welcome Screen", style: TextStyle(color: Colors.white),)
                  ],
                ))
              ],
            ),
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            TempConverterWidget()
          ],
        ),
      ),
    );
  }
}

class TempConverterWidget extends StatefulWidget {
  const TempConverterWidget ({super.key});

  @override  
  State<TempConverterWidget> createState() => _TempConverterWidgetState();
}

class _TempConverterWidgetState extends State<TempConverterWidget> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  final textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  String fahrenheit = "";

  void convertTemp() {
    final input = double.tryParse(textFieldController.text);
    if (input != null) {
      setState(() {
        fahrenheit = ((input * 9 / 5) + 32).toStringAsFixed(2);
      });
    } else {
      setState(() {
        fahrenheit = "0";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Temperature in Celcius:"),
          SizedBox(height: 10),
        TextField(
          controller: textFieldController,
          decoration: inputDecoration,
          style:  TextStyle(color: Colors.white),
        ),
        SizedBox(height: 30),
        Text("Temperature in Fahrenheit:"),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding:  EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child:  Text(fahrenheit),
        ),
        SizedBox(height: 10,),
        TextButton(onPressed: convertTemp, child: Text("Convert"))
      ],
    );
  }
}