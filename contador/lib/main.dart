import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _contador = 0;
  final _maxContador = 20;

  void decrement() {
    // print("Decrement");
    setState(() {
      _contador > 0 ? _contador-- : 0;
    });
    // print(_contador);
  }

  void increment() {
    // print("Increment");
    setState(() {
      _contador < _maxContador ? _contador++ : _maxContador;
    });
    // print(_contador);
  }

  get contador => _contador;
  get isLotado => _contador == _maxContador;
  get isVazio => _contador == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sorvetes.jpg'),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(isLotado ? "Está lotado!" : "Pode entrar!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isLotado ? Colors.red : Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Text(
                "$contador",
                style: TextStyle(fontSize: 96, color: isLotado ? Colors.red : Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isVazio ? Colors.white.withAlpha(100) : Colors.white,
                    fixedSize: Size(96, 96),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  onPressed: decrement,
                  child: Text(
                    "Saiu",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 24),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isLotado ? Colors.white.withAlpha(100) : Colors.white,
                    fixedSize: Size(96, 96),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  onPressed: increment,
                  child: Text("Entrou",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
