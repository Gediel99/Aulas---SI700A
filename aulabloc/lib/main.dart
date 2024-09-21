import 'package:aulabloc/bloc/red_bloc.dart';
import 'package:aulabloc/bloc/red_state.dart';
import 'package:aulabloc/view/receive_state.dart';
import 'package:aulabloc/view/send_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //
      create: (BuildContext context) {
        return RedBloc(RedState(amount: 100));
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Column(
          children: [
            Expanded(child: SendEvent()),
            Expanded(child: ReceiveState()),
          ],
        ),
      ),
    );
  }
}
