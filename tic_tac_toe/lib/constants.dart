import 'package:flutter/material.dart';

final backGroundColor = Colors.cyan.shade700;
final borderColor = Colors.cyan.shade200;
const characterColor = Colors.black;
var myTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30,
);

int ohScore = 0;
int exScore = 0;
int tieScore = 0;
int filledBoxes =  0;
bool ohTurn = true;  //the first player is o
List<String> displayExOh = [
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
  '',
];