import 'package:fireapp/screens/login_screen.dart';
import 'package:fireapp/services/auth_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                      FlutterLogo(size: 76,),
                      SizedBox(height: 16),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Nome',
                        ),
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                        ),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                        ),
                      ),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirmar Senha',
                        ),
                      ),
                      SizedBox(height: 16,),
                      ElevatedButton(onPressed: () {
                        if (_passwordController.text == _confirmPasswordController.text) {
                          authService.signUp(
                            email: _emailController.text, 
                            password: _passwordController.text, 
                            name: _nameController.text
                          ).then((String? error) {
                            if (error != null) {
                              final SnackBar snackBar = SnackBar(content: Text(error), backgroundColor: Colors.red);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } else {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            }
                          });
                        } else {
                          final SnackBar snackBar = SnackBar(content: Text("As senhas são diferentes."), backgroundColor: Colors.red);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }, child: Text("Criar conta")),
                      SizedBox(height: 16),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      }, child: Text("Já possui conta? Faça login"))
                    ]
                  ),
                ),
              ]
            ),
          )
        ),
      ),
    );
  }
}
