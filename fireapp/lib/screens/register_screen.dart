import 'package:fireapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 32,),
              Text("Página de registro"),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              }, child: Text("Voltar para a página de login"))
            ]
          )
        ),
      ),
    );
  }
}
