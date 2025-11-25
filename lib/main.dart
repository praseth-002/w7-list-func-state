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

//---------------------------------------
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

//---------------------------------------
// import 'package:flutter/material.dart';
// import 'ui/screens/profile.dart';
 
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ProfileApp(),
//   ));
// }


//---------------------------------------
// import 'package:flutter/material.dart';
// import './data/joke_data.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text("Favorite Joke"),
//       ),
//       body: CardContainer(),
//     )
//   ));
// }

// Color appColor = Colors.green[300]!;

// class CardContainer extends StatefulWidget {
//   const CardContainer({super.key});

//   @override
//   State<CardContainer> createState() => _CardContainerState();
// }

// class _CardContainerState extends State<CardContainer> {
//   final ValueNotifier<int?> favoriteIndex = ValueNotifier<int?>(null);

//   @override
//   void dispose() {
//     favoriteIndex.dispose(); // Clean up
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         for (int i = 0; i < jokeList.length; i++)
//           FavoriteCard(
//             title: jokeList[i].title,
//             desc: jokeList[i].desc,
//             index: i,
//             favoriteIndex: favoriteIndex,
//           ),
//       ],
//     );
//   }
// }
// class FavoriteCard extends StatelessWidget {
//   final String title;
//   final String desc;
//   final int index;
//   final ValueNotifier<int?> favoriteIndex;

//   const FavoriteCard({
//     super.key,
//     required this.title,
//     required this.desc,
//     required this.index,
//     required this.favoriteIndex,
//   });

//   void toggleFavorite() {
//     if (favoriteIndex.value == index) {
//       favoriteIndex.value = null;
//     } else {
//       favoriteIndex.value = index;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<int?>(
//       valueListenable: favoriteIndex,
//       builder: (context, currentFavorite, _) {
//         final isFavorite = currentFavorite == index;

//         return Container(
//           decoration: const BoxDecoration(
//             border: Border(
//               bottom: BorderSide(width: .5, color: Colors.grey),
//             ),
//           ),
//           padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                         color: appColor,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     Text(desc),
//                   ],
//                 ),
//               ),
//               IconButton(
//                 onPressed: toggleFavorite,
//                 icon: Icon(
//                   isFavorite ? Icons.favorite : Icons.favorite_border,
//                   color: isFavorite ? Colors.red : Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
