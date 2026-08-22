import 'package:flutter/material.dart';

class OnBoarding1Screen extends StatefulWidget {
  const new({super.key});

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("OnBoarding1Screen")));
  }
}
