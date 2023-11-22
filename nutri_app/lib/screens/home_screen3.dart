import 'package:flutter/material.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Screen 3"),
    );
  }
}
