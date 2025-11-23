// import 'package:flutter/material.dart';

// List<String> colors = ["red", "blue", "green"];

// List<Widget> getColors() {
//   return colors.map((item)=>Text(item)).toList();
// }

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(10),
//           child: ListView(
//             children: [
//               Label("Method 1: Loop in Array", bold: true),
//               //TO DO
//               for (var i = 0; i < colors.length; i++) Text(colors[i]),
//               Label("Method 2: Map", bold: true),
//               // TO DO
//               ...colors.map((item)=>Text(item)),
//               Label("Method 3: Dedicated Function", bold: true),
//               // TO DO
//               ...getColors()
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// class Label extends StatelessWidget {
//   const Label(this.text, {super.key, this.bold = false});

//   final bool bold;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';
import 'ui/screens/temperature_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  late Widget currScreen;

  void toTempScreen() {
    setState(() {
      currScreen = TemperatureScreen(buttonPress: toWelcScreen,);
    });
  }

  void toWelcScreen() {
    setState(() {
      currScreen = WelcomeScreen(buttonPress: toTempScreen,);
    });
  }

  @override
  void initState() {
    super.initState();
    currScreen = WelcomeScreen(buttonPress: toTempScreen);
  }
  
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
                // Color.fromARGB(255, 192, 22, 22),
                // Color.fromARGB(255, 220, 0, 191),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
