import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../AppRoutes.dart';
import 'main_game_screen.dart';

class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          Column(
            children: [
              const SizedBox(height: 60,),
              const Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Image(
                        image: AssetImage("assets/icons/timer.png"),
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      const Image(
                        image: AssetImage("assets/icons/music.png"),
                        height: 50,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.SCORESSCREEN);
                        },
                        child: const Image(
                          image: AssetImage("assets/icons/score.png"),
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Timer On/Off", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      const SizedBox( height: 32,),
                      const Text("Music On/Off", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                      const SizedBox( height: 32,),
                      InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.SCORESSCREEN);
                          },
                          child: const Text("High Score", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
