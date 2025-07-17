import 'package:flutter/material.dart';
import 'package:flutter_motion/flutter_motion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CardListWidget(
                  cards: [
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    // -
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    //-
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    //-
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                    Image.asset('assets/images/card.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
