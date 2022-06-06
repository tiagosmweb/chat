import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();
  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignup)
                TextFormField(
                  key: const ValueKey('name'),
                  onChanged: (name) => _formData.name = name,
                  initialValue: _formData.name,
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
                  validator: (nameForm) {
                    final name = nameForm ?? '';
                    if (name.trim().length < 5) {
                      return 'Nome deve ter no minimo 5 caracteres.';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: const ValueKey('email'),
                onChanged: (email) => _formData.email = email,
                initialValue: _formData.email,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                validator: (emailForm) {
                  final email = emailForm ?? '';
                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail valido';
                  }

                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('senha'),
                obscureText: true,
                onChanged: (password) => _formData.password = password,
                initialValue: _formData.password,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
                validator: (passwordForm) {
                  final password = passwordForm ?? '';
                  if (password.length < 6) {
                    return 'Senha deve ter no minimo 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
              ),
              TextButton(
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
