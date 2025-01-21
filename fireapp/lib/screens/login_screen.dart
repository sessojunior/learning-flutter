import 'package:fireapp/screens/register_screen.dart';
import 'package:fireapp/screens/reset_password.dart';
import 'package:fireapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  AuthService authService = AuthService();

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
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Senha',
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(onPressed: () {
                        authService.signIn(email: _emailController.text, password: _senhaController.text)
                          .then((String? error) {
                            if (error != null) {
                              final SnackBar snackBar = SnackBar(content: Text(error), backgroundColor: Colors.red,);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          });
                      }, child: Text("Entrar")),
                      SizedBox(height: 8),
                      ElevatedButton(onPressed: () {
                        signInWithGoogle();
                      }, child: Text("Entrar com Google")),
                      SizedBox(height: 16),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      }, child: Text("Não possui conta? Crie uma")),
                      TextButton(onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return ResetPasswordModal();
                        });
                      }, child: Text("Esqueceu a senha?"))
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
  
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, 
      idToken: googleAuth?.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
