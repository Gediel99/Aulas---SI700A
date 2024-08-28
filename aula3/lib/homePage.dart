// ignore_for_file: file_names
import 'package:aula3/celula.dart';
import 'package:aula3/jogoDaVelha.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

JogoDaVelha jogo = JogoDaVelha();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jogo da Velha')),
      body: Center(
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              crossAxisCount: 3,
              children: <Widget>[
            Celula(jogo: jogo, posicao: 0, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 1, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 2, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 3, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 4, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 5, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 6, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 7, setstate: () => setState(() {})),
            Celula(jogo: jogo, posicao: 8, setstate: () => setState(() {})),
            ElevatedButton(
                onPressed: () {
                  jogo.reset();
                  setState(() {});
                },
                child: const Text('Reiniciar'))
          ])),
    );
  }
}
