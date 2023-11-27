// THIRD COOOOOOOOOOOOOOOODE

// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabet = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   List<int> computePrefixTable(String pattern) {
//     final prefixTable = List<int>.filled(pattern.length, 0);
//     int i = 0;
//     for (int j = 1; j < pattern.length; j++) {
//       if (pattern[i] == pattern[j]) {
//         i++;
//         prefixTable[j] = i;
//       } else if (i > 0) {
//         i = prefixTable[i - 1];
//         j--;
//       }
//     }
//     return prefixTable;
//   }

//   bool kmpSearch(String pattern) {
//     final prefixTable = computePrefixTable(pattern);
//     int i = 0;
//     int j = 0;
//     while (i < word.length) {
//       if (pattern[j] == word[i]) {
//         i++;
//         j++;
//         if (j == pattern.length) {
//           return true;
//         }
//       } else if (j > 0) {
//         j = prefixTable[j - 1];
//       } else {
//         i++;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabet.map(
//                 (e) {
//                   return RawMaterialButton(
//                     onPressed: Game.selectedChar.contains(e)
//                         ? null
//                         : () {
//                             setState(() {
//                               Game.selectedChar.add(e);
//                               print(Game.selectedChar);
//                               if (!isCharacterInWord(e.toUpperCase())) {
//                                 Game.tries++;
//                               }
//                             });
//                           },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                     ),
//                     child: Text(
//                       e,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     fillColor: Game.selectedChar.contains(e)
//                         ? Colors.black87
//                         : Colors.blue,
//                   );
//                 },
//               ).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Game {
//   static int tries = 0;
//   static List<String> selectedChar = [];
// }

// Widget figureImage(bool isVisible, String assetPath) {
//   return Visibility(
//     visible: isVisible,
//     child: Image.asset(
//       assetPath,
//       fit: BoxFit.contain,
//     ),
//   );
// }

// Widget letter(String text, bool isVisible) {
//   return Visibility(
//     visible: isVisible,
//     child: Container(
//       padding: EdgeInsets.all(4.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }




// first code  with out any algorithm

// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   //choosing the game word
//   String word = "dog".toUpperCase();
//   //Create a list that contains the Alphabet, or you can just copy and paste it
//   List<String> alphabets = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primaryColor,
//       appBar: AppBar(
//         title: Text("Hangman"),
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: AppColor.primaryColor,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 //let's make the figure widget
//                 //let's add the images to the asset folder
//                 //Okey now we will create a Game class
//                 //Now the figure will be built according to the number of tries
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),

//           //Now we will build the Hidden word widget
//           //now let's go back to the Game class and add
//           // a new variable to store the selected character
//           /* and check if it's on the word */
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map((e) => letter(e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase())))
//                 .toList(),
//           ),

//           //Now let's build the Game keyboard
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null // we first check that we didn't selected the button before
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!word.split('').contains(e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }







// THIRD COOOOOOOOOOOOOOOODE

// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabet = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   List<int> computePrefixTable(String pattern) {
//     final prefixTable = List<int>.filled(pattern.length, 0);
//     int i = 0;
//     for (int j = 1; j < pattern.length; j++) {
//       if (pattern[i] == pattern[j]) {
//         i++;
//         prefixTable[j] = i;
//       } else if (i > 0) {
//         i = prefixTable[i - 1];
//         j--;
//       }
//     }
//     return prefixTable;
//   }

//   bool kmpSearch(String pattern) {
//     final prefixTable = computePrefixTable(pattern);
//     int i = 0;
//     int j = 0;
//     while (i < word.length) {
//       if (pattern[j] == word[i]) {
//         i++;
//         j++;
//         if (j == pattern.length) {
//           return true;
//         }
//       } else if (j > 0) {
//         j = prefixTable[j - 1];
//       } else {
//         i++;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabet.map(
//                 (e) {
//                   return RawMaterialButton(
//                     onPressed: Game.selectedChar.contains(e)
//                         ? null
//                         : () {
//                             setState(() {
//                               Game.selectedChar.add(e);
//                               print(Game.selectedChar);
//                               if (!isCharacterInWord(e.toUpperCase())) {
//                                 Game.tries++;
//                               }
//                             });
//                           },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(4.0),
//                     ),
//                     child: Text(
//                       e,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     fillColor: Game.selectedChar.contains(e)
//                         ? Colors.black87
//                         : Colors.blue,
//                   );
//                 },
//               ).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Game {
//   static int tries = 0;
//   static List<String> selectedChar = [];
// }

// Widget figureImage(bool isVisible, String assetPath) {
//   return Visibility(
//     visible: isVisible,
//     child: Image.asset(
//       assetPath,
//       fit: BoxFit.contain,
//     ),
//   );
// }

// Widget letter(String text, bool isVisible) {
//   return Visibility(
//     visible: isVisible,
//     child: Container(
//       padding: EdgeInsets.all(4.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.white),
//         borderRadius: BorderRadius.circular(4.0),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 24.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ),
//   );
// }



// SECOOOOOOOOOOOOOOND COOOOOOOOOOOODE

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabets = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!word.split('').contains(e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// new KMP algorithm using

// import 'dart:math';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabets = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   List<int> piTable(String pattern) {
//     int m = pattern.length;
//     List<int> pi = List<int>.filled(m, 0);
//     int k = 0;

//     for (int i = 1; i < m; i++) {
//       while (k > 0 && pattern[k] != pattern[i]) {
//         k = pi[k - 1];
//       }

//       if (pattern[k] == pattern[i]) {
//         k++;
//       }

//       pi[i] = k;
//     }

//     return pi;
//   }

//   bool kmpSearch(String text, String pattern) {
//     int n = text.length;
//     int m = pattern.length;
//     List<int> pi = piTable(pattern);

//     int i = 0;
//     int j = 0;

//     while (i < n) {
//       if (text[i] == pattern[j]) {
//         i++;
//         j++;

//         if (j == m) {
//           return true;
//         }
//       } else {
//         if (j != 0) {
//           j = pi[j - 1];
//         } else {
//           i++;
//         }
//       }
//     }

//     return false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!kmpSearch(word, e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// neww newwwwwwwwwwwwwwwwwwwwwwwwwwwwww

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';

// import 'utils/game_result_popup.dart'; // Replace with actual path

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabets = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   List<int> piTable(String pattern) {
//     int m = pattern.length;
//     List<int> pi = List<int>.filled(m, 0);
//     int k = 0;

//     for (int i = 1; i < m; i++) {
//       while (k > 0 && pattern[k] != pattern[i]) {
//         k = pi[k - 1];
//       }

//       if (pattern[k] == pattern[i]) {
//         k++;
//       }

//       pi[i] = k;
//     }

//     return pi;
//   }

//   bool kmpSearch(String text, String pattern) {
//     int n = text.length;
//     int m = pattern.length;
//     List<int> pi = piTable(pattern);

//     int i = 0;
//     int j = 0;

//     while (i < n) {
//       if (text[i] == pattern[j]) {
//         i++;
//         j++;

//         if (j == m) {
//           return true;
//         }
//       } else {
//         if (j != 0) {
//           j = pi[j - 1];
//         } else {
//           i++;
//         }
//       }
//     }

//     return false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//     startTimer();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   void startTimer() {
//     Timer(Duration(seconds: 10), handleTimerExpired);
//   }

//   void handleTimerExpired() {
//     if (Game.selectedChar.length == 0) {
//       // User didn't guess any letters for 10 seconds
//       GameResultPopup.showNoGuessDialog(context, restartGame);
//     }
//   }

//   void checkGameStatus() {
//     if (Game.tries >= 6) {
//       // User didn't guess the word within six tries
//       GameResultPopup.showGameOverDialog(context, restartGame);
//     } else if (Game.selectedChar.toSet().containsAll(word.split(''))) {
//       // User guessed the word correctly within six tries
//       GameResultPopup.showGameWonDialog(context, restartGame);
//     }
//   }

//   void restartGame() {
//     setState(() {
//       Game.selectedChar.clear();
//       Game.tries = 0;
//       word = getRandomWord();
//       startTimer();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!kmpSearch(word, e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                             checkGameStatus();
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// with timeeeeeeeeeeeeeeeeee

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';

// import 'utils/game_result_popup.dart'; // Replace with actual path

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeApp(),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   const HomeApp({Key? key}) : super(key: key);

//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   List<String> words = [
//     "DOG",
//     "CAT",
//     "APPLE",
//     "ORANGE",
//     "BANANA",
//     "CAR",
//     "HOUSE",
//     "COMPUTER"
//   ];

//   String word = '';
//   List<String> alphabets = [
//     "A",
//     "B",
//     "C",
//     "D",
//     "E",
//     "F",
//     "G",
//     "H",
//     "I",
//     "J",
//     "K",
//     "L",
//     "M",
//     "N",
//     "O",
//     "P",
//     "Q",
//     "R",
//     "S",
//     "T",
//     "U",
//     "V",
//     "W",
//     "X",
//     "Y",
//     "Z"
//   ];

//   List<int> piTable(String pattern) {
//     int m = pattern.length;
//     List<int> pi = List<int>.filled(m, 0);
//     int k = 0;

//     for (int i = 1; i < m; i++) {
//       while (k > 0 && pattern[k] != pattern[i]) {
//         k = pi[k - 1];
//       }

//       if (pattern[k] == pattern[i]) {
//         k++;
//       }

//       pi[i] = k;
//     }

//     return pi;
//   }

//   bool kmpSearch(String text, String pattern) {
//     int n = text.length;
//     int m = pattern.length;
//     List<int> pi = piTable(pattern);

//     int i = 0;
//     int j = 0;

//     while (i < n) {
//       if (text[i] == pattern[j]) {
//         i++;
//         j++;

//         if (j == m) {
//           return true;
//         }
//       } else {
//         if (j != 0) {
//           j = pi[j - 1];
//         } else {
//           i++;
//         }
//       }
//     }

//     return false;
//   }

//   @override
//   void initState() {
//     super.initState();
//     word = getRandomWord();
//     startTimer();
//   }

//   String getRandomWord() {
//     final random = Random();
//     final randomIndex = random.nextInt(words.length);
//     return words[randomIndex].toUpperCase();
//   }

//   void startTimer() {
//     Timer(Duration(seconds: 10), handleTimerExpired);
//   }

//   void handleTimerExpired() {
//     if (Game.selectedChar.length == 0) {
//       // User didn't guess any letters for 20 seconds
//       GameResultPopup.showNoGuessDialog(context, restartGame);
//     }
//   }

//   void checkGameStatus() {
//     if (Game.tries >= 6) {
//       // User didn't guess the word within six tries
//       GameResultPopup.showGameOverDialog(context, restartGame);
//     } else if (Game.selectedChar.toSet().containsAll(word.split(''))) {
//       // User guessed the word correctly within six tries
//       GameResultPopup.showGameWonDialog(context, restartGame);
//     }
//   }

//   void restartGame() {
//     setState(() {
//       Game.selectedChar.clear();
//       Game.tries = 0;
//       word = getRandomWord();
//       startTimer();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[900],
//       appBar: AppBar(
//         title: const Text('Hangman'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 figureImage(Game.tries >= 0, "assets/hang.png"),
//                 figureImage(Game.tries >= 1, "assets/head.png"),
//                 figureImage(Game.tries >= 2, "assets/body.png"),
//                 figureImage(Game.tries >= 3, "assets/ra.png"),
//                 figureImage(Game.tries >= 4, "assets/la.png"),
//                 figureImage(Game.tries >= 5, "assets/rl.png"),
//                 figureImage(Game.tries >= 6, "assets/ll.png"),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: word
//                 .split('')
//                 .map(
//                   (e) => letter(
//                     e.toUpperCase(),
//                     !Game.selectedChar.contains(e.toUpperCase()),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(
//             width: double.infinity,
//             height: 250.0,
//             child: GridView.count(
//               crossAxisCount: 7,
//               mainAxisSpacing: 8.0,
//               crossAxisSpacing: 8.0,
//               padding: EdgeInsets.all(8.0),
//               children: alphabets.map((e) {
//                 return RawMaterialButton(
//                   onPressed: Game.selectedChar.contains(e)
//                       ? null
//                       : () {
//                           setState(() {
//                             Game.selectedChar.add(e);
//                             print(Game.selectedChar);
//                             if (!kmpSearch(word, e.toUpperCase())) {
//                               Game.tries++;
//                             }
//                             checkGameStatus();
//                           });
//                         },
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   child: Text(
//                     e,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   fillColor: Game.selectedChar.contains(e)
//                       ? Colors.black87
//                       : Colors.blue,
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }







