import 'package:fireapp/services/auth_service.dart';
import 'package:flutter/material.dart';

class ResetPasswordModal extends StatefulWidget {
  const ResetPasswordModal({super.key});

  @override
  State<ResetPasswordModal> createState() => _ResetPasswordModalState();
}

class _ResetPasswordModalState extends State<ResetPasswordModal> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Recuperar Senha"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: "E-mail",
            prefixIcon: Icon(Icons.email),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Informe um e-mail válido';
            }
            return null;
          }
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Recuperar senha"),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                authService.resetPassword(email: _emailController.text).then((error) {
                  Navigator.of(context).pop();
                  if (error != null) {
                    final snackBar = SnackBar(content: Text(error), backgroundColor: Colors.red,);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    final snackBar = const SnackBar(content: Text("Um link de redefinição de senha foi enviado para o seu e-mail."), backgroundColor: Colors.green,);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              }
            },
          ),
        ],
    );
  }
}