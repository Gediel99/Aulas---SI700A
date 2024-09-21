import 'package:aulabloc/bloc/red_bloc.dart';
import 'package:aulabloc/bloc/red_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendEvent extends StatelessWidget {
  const SendEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<RedBloc>(context).add(SemRed());
          },
          child: const Text('Sem Red'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<RedBloc>(context).add(PoucoRed());
          },
          child: const Text('Pouco Red'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<RedBloc>(context).add(NormalRed());
          },
          child: const Text('Normal Red'),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<RedBloc>(context).add(MuitoRed());
          },
          child: const Text('Muito Red'),
        ),
      ],
    );
  }
}
