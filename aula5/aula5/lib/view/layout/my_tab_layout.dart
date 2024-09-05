import 'package:aula5/view/screens/primeira_tela.dart';
import 'package:aula5/view/screens/segunda_tela.dart';
import 'package:aula5/view/screens/terceira_tela.dart';
import 'package:flutter/material.dart';

class MyTabLayout extends StatefulWidget {
  const MyTabLayout({super.key});

  @override
  State<MyTabLayout> createState() => _MyTabLayoutState();
}

class _MyTabLayoutState extends State<MyTabLayout> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('My Tab Layout'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PrimeiraTela(),
                SegundaTela(),
                TerceiraTela(),
              ],
            )));
  }
}
