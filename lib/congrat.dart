import 'package:flutter/material.dart';

class CongratScreen extends StatefulWidget {
  const CongratScreen({super.key});

  @override
  State<CongratScreen> createState() => _CongratScreenState();
}

class _CongratScreenState extends State<CongratScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Congratulations!'),
        centerTitle: true
        )
      );
  }
}