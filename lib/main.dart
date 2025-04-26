import 'package:flutter/material.dart';
import 'package:habbition_test/Controller/Categoryscreen_controller.dart';
import 'package:habbition_test/Controller/Homescreen_controller.dart';
import 'package:habbition_test/view/Bottomnavibar_screen/Bottomnavibar_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomescreenController()),
    ChangeNotifierProvider(create: (context) => CategoryscreenController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomnavibarscreen(),
    );
  }
}
