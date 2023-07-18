import 'dart:async';

import 'package:animation/contants/main_contants.dart';
import 'package:flutter/material.dart';
import 'package:animation/contants/welcome_screen.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/first',
        routes: {
          '/first': (context) => const MyHomePage(),
          '/welcomeScreen': (context) => const WelcomeScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(
          context,
          CustomPageRoute(
            const WelcomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(tag: 'logo', child: SvgPicture.asset(MainConstants.logo)),
      ),
    );
  }
}

class CustomPageRoute<t> extends PageRoute<t> {
  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(seconds: 2);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation secondaryAnimation,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
