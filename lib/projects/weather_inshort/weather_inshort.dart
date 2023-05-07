import 'dart:ui';

import 'package:flutter/material.dart';
import './screens/loading_screen.dart';

class WeatherInshort extends StatefulWidget {
  const WeatherInshort({super.key});

  @override
  State<WeatherInshort> createState() => _WeatherInshortState();
}

class _WeatherInshortState extends State<WeatherInshort> {
  @override
  void initState() {
    DartPluginRegistrant.ensureInitialized();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
