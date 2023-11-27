////newwwwwwwwwwwwwwwww timeeeeeeeeeee   codeeeeeeeeee

// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:firstproject/ui/colors.dart';
// import 'package:firstproject/ui/widget/figure_image.dart';
// import 'package:firstproject/ui/widget/letter.dart';
// import 'package:firstproject/utils/game.dart';
// import 'package:flutter/services.dart';

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

//   // Remaining time for the user to guess the word
//   int remainingTime = 10;
//   Timer? timer;

//   // Restarts the timer with 10 seconds
//   void startTimer() {
//     setState(() {
//       remainingTime = 10;
//       timer?.cancel(); // Cancel previous timer if running
//       timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
//         setState(() {
//           remainingTime--;
//           if (remainingTime == 0) {
//             timer.cancel();
//             handleTimerExpired();
//           }
//         });
//       });
//     });
//   }

//   void handleTimerExpired() {
//     if (Game.selectedChar.length == 0) {
//       // User didn't guess any letters within the time limit
//       GameResultPopup.showNoGuessDialog(context, restartGame);
//     } else {
//       // CPU automatically selects a word after the time limit
//       String cpuGuess = getRandomWord();
//       Game.selectedChar
//           .addAll(cpuGuess.split('')); // Automatically selects all letters
//       checkGameStatus();
//       setState(() {
//         word = cpuGuess; // Display CPU's word
//       });
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
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: Stack(
//                 children: [
//                   figureImage(Game.tries >= 0, "assets/hang.png"),
//                   figureImage(Game.tries >= 1, "assets/head.png"),
//                   figureImage(Game.tries >= 2, "assets/body.png"),
//                   figureImage(Game.tries >= 3, "assets/ra.png"),
//                   figureImage(Game.tries >= 4, "assets/la.png"),
//                   figureImage(Game.tries >= 5, "assets/rl.png"),
//                   figureImage(Game.tries >= 6, "assets/ll.png"),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: word
//                   .split('')
//                   .map(
//                     (e) => letter(
//                       e.toUpperCase(),
//                       !Game.selectedChar.contains(e.toUpperCase()),
//                     ),
//                   )
//                   .toList(),
//             ),
//             SizedBox(
//               width: double.infinity,
//               height: 250.0,
//               child: GridView.count(
//                 crossAxisCount: 7,
//                 mainAxisSpacing: 8.0,
//                 crossAxisSpacing: 8.0,
//                 padding: EdgeInsets.all(8.0),
//                 children: alphabets.map((e) {
//                   return RawMaterialButton(
//                     onPressed: Game.selectedChar.contains(e)
//                         ? null
//                         : () {
//                             setState(() {
//                               Game.selectedChar.add(e);
//                               print(Game.selectedChar);
//                               if (!kmpSearch(word, e.toUpperCase())) {
//                                 Game.tries++;
//                               }
//                               checkGameStatus();
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
//                 }).toList(),
//               ),
//             ),
//             Text(
//               'Time Remaining: $remainingTime seconds',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16.0,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// mycode chg..............
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:firstproject/ui/colors.dart';
import 'package:firstproject/ui/widget/figure_image.dart';
import 'package:firstproject/ui/widget/letter.dart';
import 'package:flutter/services.dart';

import 'utils/game_result_popup.dart'; // Replace with actual path

void main() {
  runApp(const MyApp());
}

class Game {
  static int tries = 0;
  static Set<String> selectedChar = {};

  static void reset() {
    tries = 0;
    selectedChar.clear();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> words = [
    "DOG",
    "CAT",
    "APPLE",
    "ORANGE",
    "BANANA",
    "CAR",
    "HOUSE",
    "PUPPY"
  ];

  String word = '';
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  List<int> piTable(String pattern) {
    int m = pattern.length;
    List<int> pi = List<int>.filled(m, 0);
    int k = 0;

    for (int i = 1; i < m; i++) {
      while (k > 0 && pattern[k] != pattern[i]) {
        k = pi[k - 1];
      }

      if (pattern[k] == pattern[i]) {
        k++;
      }

      pi[i] = k;
    }

    return pi;
  }

  bool kmpSearch(String text, String pattern) {
    int n = text.length;
    int m = pattern.length;
    List<int> pi = piTable(pattern);

    int i = 0;
    int j = 0;

    while (i < n) {
      if (text[i] == pattern[j]) {
        i++;
        j++;

        if (j == m) {
          return true;
        }
      } else {
        if (j != 0) {
          j = pi[j - 1];
        } else {
          i++;
        }
      }
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      word = getRandomWord();
      Game.reset();
      startTimer();
    });
  }

  String getRandomWord() {
    final random = Random();
    final randomIndex = random.nextInt(words.length);
    return words[randomIndex].toUpperCase();
  }

  // Remaining time for the user to guess the word
  int remainingTime = 10;
  Timer? timer;

  // Restarts the timer with 10 seconds
  void startTimer() {
    setState(() {
      remainingTime = 10;
      timer?.cancel(); // Cancel previous timer if running
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          remainingTime--;
          if (remainingTime == 0) {
            timer.cancel();
            handleTimerExpired();
          }
        });
      });
    });
  }

  void handleTimerExpired() {
    if (Game.selectedChar.length == 0) {
      // User didn't guess any letters within the time limit
      GameResultPopup.showNoGuessDialog(context, restartGame);
    } else {
      // CPU automatically selects a word after the time limit
      String cpuGuess = getRandomWord();
      Game.selectedChar
          .addAll(cpuGuess.split('')); // Automatically selects all letters
      checkGameStatus();
      if (!Game.selectedChar.toSet().containsAll(word.split(''))) {
        setState(() {
          word =
              cpuGuess; // Display CPU's word if user has not already guessed it
        });
      }
    }
  }

  void checkGameStatus() {
    if (Game.tries >= 6) {
      // User didn't guess the word within six tries
      GameResultPopup.showGameOverDialog(context, restartGame);
    } else if (Game.selectedChar.toSet().containsAll(word.split(''))) {
      // User guessed the word correctly within six tries
      GameResultPopup.showGameWonDialog(context, restartGame);
    }
  }

  void restartGame() {
    setState(() {
      startGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
      // debugShowCheckedModeBanner: false,
        title: const Text('Hangman'),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  figureImage(Game.tries >= 0, "assets/hang.png"),
                  figureImage(Game.tries >= 1, "assets/head.png"),
                  figureImage(Game.tries >= 2, "assets/body.png"),
                  figureImage(Game.tries >= 3, "assets/ra.png"),
                  figureImage(Game.tries >= 4, "assets/la.png"),
                  figureImage(Game.tries >= 5, "assets/rl.png"),
                  figureImage(Game.tries >= 6, "assets/ll.png"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: word
                  .split('')
                  .map(
                    (e) => letter(
                      e.toUpperCase(),
                      !Game.selectedChar.contains(e.toUpperCase()),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              width: double.infinity,
              height: 250.0,
              child: GridView.count(
                crossAxisCount: 7,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: alphabets.map((e) {
                  return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                        ? null
                        : () {
                            setState(() {
                              Game.selectedChar.add(e);
                              print(Game.selectedChar);
                              if (!kmpSearch(word, e.toUpperCase())) {
                                Game.tries++;
                              }
                              checkGameStatus();
                            });
                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fillColor: Game.selectedChar.contains(e)
                        ? Colors.black87
                        : Colors.blue,
                  );
                }).toList(),
              ),
            ),
            Text(
              'Time Remaining: $remainingTime seconds',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
