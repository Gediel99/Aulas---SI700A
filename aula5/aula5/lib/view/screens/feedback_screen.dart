import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  Future<String?> futureResult;

  FeedbackScreen({super.key, required this.futureResult});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: futureResult,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data == "success") {
              return successMessage();
            } else {
              return errorMessage(snapshot);
            }
          } else {
            return unknownErrorMessage();
          }
        });
  }
}

Widget successMessage() {
  return const Center(
      child: SingleChildScrollView(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        Icons.check_circle,
      ),
      Text(
        "Dados submetidos com sucesso!",
        style: TextStyle(fontSize: 24, color: Colors.green),
      )
    ]),
  ));
}

Widget errorMessage(AsyncSnapshot<String?> snapshot) {
  return Center(
      child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error, color: Colors.red),
        Text(
          'Erro ao submeter dados: $snapshot',
          style: const TextStyle(fontSize: 24, color: Colors.red),
        ),
      ],
    ),
  ));
}

Widget unknownErrorMessage() {
  return const Center(
      child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, color: Colors.red),
        Text(
          'Erro desconhecido',
          style: TextStyle(fontSize: 24, color: Colors.red),
        ),
      ],
    ),
  ));
}
