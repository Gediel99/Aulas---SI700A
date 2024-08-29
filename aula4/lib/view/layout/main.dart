import 'package:aula4/view/layout/my_bottom_navigation_bar.dart';
import 'package:aula4/view/layout/my_navigation_drawer.dart';
import 'package:aula4/view/layout/my_tab_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNavigationDrawer(),
    );
  }
}
