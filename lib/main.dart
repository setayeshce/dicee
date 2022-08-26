import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(child: Text("Dicee")),
          backgroundColor: Colors.grey[900],
          elevation: 10,
        ),
        body: const DicePage()),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only( bottom: 24.0 , top: 32),
          child: Text("play your chance with dice", style: TextStyle(
            color: Colors.white,
            fontSize: 24 ,
            fontWeight: FontWeight.bold
          ),),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Image(
            image: AssetImage("assets/images/hand.jpg"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            images("dice$leftDiceNumber"),
            images("dice$rightDiceNumber"),
          ],
        ),
      ],
    );
  }

  void changeDiceFace() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Widget images(String imageName) {
    return Expanded(
        child: TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.transparent;
          if (states.contains(MaterialState.hovered)) return Colors.transparent;
          if (states.contains(MaterialState.pressed)) return Colors.transparent;
          return Colors.transparent;
        }),
      ),
      onPressed: changeDiceFace,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image(
          image: AssetImage("assets/images/$imageName.png"),
        ),
      ),
    ));
  }
}
