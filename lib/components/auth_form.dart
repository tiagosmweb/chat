import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Entrar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Criar uma nova conta?'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
