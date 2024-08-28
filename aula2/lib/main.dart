import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const MyHomePage(
        title: 'Aula 2',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> getChildren() {
    List<Widget> children = [];
    int numChildren = 100;
    for (int i = 0; i <= numChildren; i++) {
      children.add(Card(
        child: SizedBox(
          width: 100,
          height: 50,
          child: Center(
            child: Text(
              '$i',
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ),
      ));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getChildren()),
        ),
      ),
    );
  }
}
