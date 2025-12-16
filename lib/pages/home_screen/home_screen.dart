import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
        Image.asset("assets/images/logo/islami_logo.png"),)
    );
  }
}

