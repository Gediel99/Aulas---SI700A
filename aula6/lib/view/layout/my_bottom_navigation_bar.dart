import 'package:aula6/view/screens/primeira_tela.dart';
import 'package:aula6/view/screens/segunda_tela.dart';
import 'package:aula6/view/screens/terceira_tela.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bottom Navigation Bar'),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: const [
          PrimeiraTela(),
          SegundaTela(),
          TerceiraTela(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _currentScreen = value),
        currentIndex: _currentScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Primeira Tela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Segunda Tela',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Terceira Tela',
          ),
        ],
      ),
    );
  }
}
