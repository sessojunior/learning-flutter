import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meu app",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Scaffold(
        body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.amber,
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.red,
                  width: 300,
                  height: 100,
                  child: Center(child:
                    Text("Olá mundo!",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                ),
              ]
            ),
          ),
      ),
    );
  }
}
