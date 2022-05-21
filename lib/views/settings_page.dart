import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              "assets/icons/v.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          const Positioned(
            top: 60,
            left: 140,
            right: 50,
            child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 140,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/timer.png",
                  height: 90,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Timer On/Off",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 270,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/music.png",
                  height: 90,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Music On/Off",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 390,
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/score.png",
                  height: 90,
                ),
                const SizedBox(width: 10),
                const Text(
                  "High Score",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
