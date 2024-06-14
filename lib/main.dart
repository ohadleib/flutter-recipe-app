import 'package:flutter/material.dart';

import 'copmponents/recipes_screen.dart';

void main() {
  // פונקציה ראשית שמתחילה את האפליקציה
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // וידג'ט הבסיס של האפליקציה
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // מסיר את הבאנר של מוד הדיבוג
      debugShowCheckedModeBanner: false,
      // מסך הבית של האפליקציה
      home: RecipesHomeScreen(),
    );
  }
}