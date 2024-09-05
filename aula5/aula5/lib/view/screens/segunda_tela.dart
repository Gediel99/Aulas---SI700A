import 'package:aula5/view/screens/tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4.0),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(
                "https://raw.githubusercontent.com/ulissesdias/si700/main/e_forms_intro/assets/images/ulisses.gif",
                fit: BoxFit.cover),
          ),
          const Text(
            "Professor Ulisses Martins Dias",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Professor Bonito, Inteligente e Rico",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              letterSpacing: 2.0,
            ),
          )
        ],
      ),
    );
  }
}
