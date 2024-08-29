import 'package:aula4/view/screens/primeira_tela.dart';
import 'package:aula4/view/screens/segunda_tela.dart';
import 'package:aula4/view/screens/terceira_tela.dart';
import 'package:aula4/view/screens/tip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyNavigationDrawer extends StatefulWidget {
  MyNavigationDrawer({super.key});
  Tip tip = Tip();

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  int _currentScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Navigation Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/avatar.jpg'),
                    // Image will stretch to fit the container
                  ),
                ),
              ),
            ),
            ListTile(
                title: const Text('Primeira Tela'),
                onTap: () {
                  setState(() => _currentScreen = 0);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('Segunda Tela'),
                onTap: () {
                  setState(() => _currentScreen = 1);
                  Navigator.pop(context);
                }),
            ListTile(
                title: const Text('Terceira Tela'),
                onTap: () {
                  setState(() => _currentScreen = 2);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentScreen,
        children: [
          const PrimeiraTela(),
          SegundaTela(
            tip: widget.tip,
          ),
          const TerceiraTela(),
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
