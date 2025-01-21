import 'package:fireapp/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      FlutterLogo(size: 76),
                      SizedBox(height: 8,),
                      Text("Página de login"),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                        ),
                      ),
                      TextField(
                        controller: _senhaController,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(onPressed: () {}, child: Text("Entrar")),
                      SizedBox(height: 8),
                      ElevatedButton(onPressed: () {}, child: Text("Entrar com Google")),
                      SizedBox(height: 16),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      }, child: Text("Não possui conta? Crie uma"))
                    ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
