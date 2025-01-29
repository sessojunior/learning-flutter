import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Pode entrar", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(
            "11",
            style: TextStyle(fontSize: 48),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text("Saiu"),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text("Entrou"),
              )
            ],
          )
        ],
      ),
    );
  }
}
