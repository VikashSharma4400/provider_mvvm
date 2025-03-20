import 'package:flutter/material.dart';
import 'package:provider_mvvm/view/home/home_screen.dart';
import 'package:provider_mvvm/view/login/view/login_screen.dart';
import 'package:provider_mvvm/view/splash_screen.dart';

class AppRoutes{

  static const splashScreen = "/splash_screen";
  static const loginScreen = "/login_screen";
  static const homeScreen = "/home_screen";

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route"),
            ),
          );
        });

    }
  }

}