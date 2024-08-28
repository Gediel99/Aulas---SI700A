import 'package:aula3/homePage.dart';
import 'package:aula3/jogoDaVelha.dart';
import 'package:flutter/material.dart';

class Celula extends StatefulWidget {
  final JogoDaVelha jogo;
  final int posicao;
  final Function() setstate;

  const Celula(
      {required this.jogo,
      required this.posicao,
      required this.setstate,
      super.key});

  @override
  State<Celula> createState() => _CelulaState();
}

initState() {
  initState();
  jogo = JogoDaVelha();
}

class _CelulaState extends State<Celula> {
  _fazerJogada() {
    if (widget.jogo.jogar(widget.posicao)) {
      if (widget.jogo.verificarVitoria()) {
        _showGameOverDialog(
            'O jogador ${widget.jogo.jogador == 1 ? 'O' : 'X'} venceu!');
      } else if (widget.jogo.verificarEmpate()) {
        _showGameOverDialog('Deu Velha!');
      }
      widget.setstate(); 
    }
  }

  void _showGameOverDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fim de jogo'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                widget.jogo.reset();
                widget.setstate(); 
                Navigator.pop(context);
              },
              child: const Text('Reiniciar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _fazerJogada,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            widget.jogo.obterEstadoPosicao(widget.posicao).toString(),
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
