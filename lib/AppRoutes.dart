

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:zapps/views/home_screen.dart';
import 'package:zapps/views/main_game_screen.dart';
import 'package:zapps/views/more_screen.dart';
import 'package:zapps/views/setting_screen.dart';

class AppRoutes {
  static const String HOMESCREEN = "/homescreen";
  static const String MORESCREEN = "/morescreen";
  static const String GAMESCREEN = "/gamescreen";
  static const String SETTINGSCREEN = "/settingscreen";

  static List<GetPage> routes = [
    GetPage(
        name: HOMESCREEN,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SETTINGSCREEN,
        page: () => SettingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: MORESCREEN,
        page: () => MoreScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: GAMESCREEN,
        page: () => GameScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
  ];
}
