import 'package:flutter/material.dart';
import 'package:pomodorotimer/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 242, 66, 39),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
