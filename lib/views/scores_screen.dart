import 'package:flutter/material.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/score-bg.png",
            // fit: BoxFit.cover,
            // height: double.infinity,
            // width: double.infinity,
            // alignment: Alignment.center,
  
          ),
        ],
      ),
    );
  }
}
