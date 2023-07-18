import 'package:animation/contants/main_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 200,
            child: Hero(
              tag: 'logo',
              child: SvgPicture.asset(MainConstants.logo),
            ),
          ),
        ],
      ),
    );
  }
}
