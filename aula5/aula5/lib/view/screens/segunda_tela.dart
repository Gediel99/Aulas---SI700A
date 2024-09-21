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
                "https://avatars.githubusercontent.com/u/95309923?s=400&u=a04d3caaab8c82b326b20afc2e73f88a6cf67f0e&v=4",
                fit: BoxFit.cover),
          ),
          const Text(
            "Gediel Durães de Almeida",
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
            "Desenvolvedor Mobile",
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
