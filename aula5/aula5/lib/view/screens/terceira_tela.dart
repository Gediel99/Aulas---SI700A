import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key});

  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.green],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200, // Tamanho do círculo
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://avatars.githubusercontent.com/u/95309923?s=400&u=a04d3caaab8c82b326b20afc2e73f88a6cf67f0e&v=4",
                  ),
                  fit: BoxFit.cover, // Ajusta a imagem dentro do círculo
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), // Espaço entre a imagem e a coluna
          const Column(
            children: [
              SizedBox(height: 10),
              const Text(
                "Gediel Durães de Almeida",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
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
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.white),
                  Icon(
                    Icons.alarm,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
