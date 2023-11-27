// import 'package:flutter/material.dart';

// class GameResultPopup {
//   static void showGameResultDialog(BuildContext context, String title, String content, VoidCallback onRestart) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(content),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 onRestart();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Restart'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   static void showTimeoutDialog(BuildContext context, VoidCallback onRestart) {
//     showGameResultDialog(context, 'Timeout', 'You didn\'t guess any letters for 10 seconds.', onRestart);
//   }

//   static void showGameWonDialog(BuildContext context, VoidCallback onRestart) {
//     showGameResultDialog(context, 'Congratulations', 'You guessed the word correctly!', onRestart);
//   }

//   static void showGameOverDialog(BuildContext context, VoidCallback onRestart) {
//     showGameResultDialog(context, 'Game Over', 'You failed to guess the word.', onRestart);
//   }

//   static void showNoGuessDialog(BuildContext context, void Function() restartGame) {}

//   static void showFailureDialog(BuildContext context, void Function() restartGame) {}
// }

// newwwwwwwwww codeeeee

import 'package:flutter/material.dart';

class GameResultPopup {
  static void showNoGuessDialog(BuildContext context, Function() restartGame) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Guess'),
          content: Text('You did not guess any letters.'),
          actions: [
            TextButton(
              onPressed: () {
                restartGame();
                Navigator.of(context).pop();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  static void showGameOverDialog(BuildContext context, Function() restartGame) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You did not guess the word within six tries.'),
          actions: [
            TextButton(
              onPressed: () {
                restartGame();
                Navigator.of(context).pop();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  static void showGameWonDialog(BuildContext context, Function() restartGame) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You guessed the word correctly!'),
          actions: [
            TextButton(
              onPressed: () {
                restartGame();
                Navigator.of(context).pop();
              },
              child: Text('Restart'),
            ),
          ],
        );
      },
    );
  }
}
