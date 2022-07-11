import 'package:flutter/material.dart';

class Testxx extends StatefulWidget {
  const Testxx({super.key});

  @override
  State<Testxx> createState() => _TestxxState();
}

class _TestxxState extends State<Testxx> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text('text'),
      ),
    );
  }
}