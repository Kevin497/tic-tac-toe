import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      color: Colors.cyan.shade700,
      letterSpacing: 3,
    ),
  );
  static var myNewFontBlack = GoogleFonts.pressStart2p(
    textStyle: TextStyle(
      color: Colors.black,
      letterSpacing: 3,
      fontSize: 15,
    ),
  );
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player X',
                      style: myNewFontBlack,
                    ),
                    const SizedBox(height: 10,),

                    Text(
                      exScore.toString(),
                      style: myNewFontBlack,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DRAW',
                      style: myNewFontBlack,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      tieScore.toString(),
                      style: myNewFontBlack,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'PLAYER O',
                      style: myNewFontBlack,
                    ),
                    const SizedBox(height: 10,),

                    Text(
                      ohScore.toString(),
                      style: myNewFontBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: const TextStyle(
                            fontSize: 100,
                            color: characterColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(borderColor),
              ),
              onPressed: () {
                clearBoard();
                ohScore = 0;
                exScore = 0;
                tieScore = 0;
              },
              child: Text(
                'RESTART',
                style: myNewFontBlack,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            'TIC-TAC-TOE',
            style: myNewFontBlack,
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }

  void checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      showWinDialog(displayExOh[0]);
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      showWinDialog(displayExOh[3]);
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      showWinDialog(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      showWinDialog(displayExOh[0]);
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      showWinDialog(displayExOh[1]);
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      showWinDialog(displayExOh[2]);
    }
    if (displayExOh[8] == displayExOh[4] &&
        displayExOh[8] == displayExOh[0] &&
        displayExOh[8] != '') {
      showWinDialog(displayExOh[8]);
    }
    if (displayExOh[4] == displayExOh[2] &&
        displayExOh[4] == displayExOh[6] &&
        displayExOh[4] != '') {
      showWinDialog(displayExOh[4]);
    } else if (filledBoxes == 9) {
      showDrawDialog();
    }
  }

  void tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'WINNER IS: $winner',
              style: myNewFontBlack.copyWith(fontSize: 12),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child:  Text(
                  'Play Again!',
                  style: myNewFontBlack.copyWith(color: Colors.blue, fontSize: 10),
                ),
              ),
            ],
          );
        });
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(
              'DRAW!',
              style: myNewFontBlack,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  tieScore += 1;
                  clearBoard();
                  Navigator.of(context).pop();
                },
                child:  Text(
                  'Play Again!',
                  style: myNewFontBlack.copyWith(color: Colors.blue, fontSize: 10),
                ),
              ),
            ],
          );
        });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
