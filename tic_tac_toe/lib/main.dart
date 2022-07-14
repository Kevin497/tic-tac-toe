import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants.dart';

import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartingScreen(),
    );
  }
}

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
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

  @override
  Widget build(BuildContext context) {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });

    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    Text(
                      'TIC TAC TOE',
                      style: myNewFontBlack.copyWith(
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    AvatarGlow(
                      endRadius: 150,
                      duration: const Duration(
                        seconds: 2,
                      ),
                      glowColor: Colors.white,
                      repeat: true,
                      repeatPauseDuration: Duration(
                        seconds: 1,
                      ),
                      startDelay: Duration(
                        seconds: 1,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.cyan.shade200,
                          radius: 150,
                          child: SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.asset(
                              'lib/images/tic-tac-toe-grid-removebg-preview__1_-removebg-preview.png',
                              color: Colors.black,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    SizedBox(
                      height: 70,
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(borderColor),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'PLAY',
                          style: myNewFontBlack.copyWith(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
