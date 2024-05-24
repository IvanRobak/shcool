import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  var _isLoggin = false;
  var _isPasswordVisible = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    if (_isLoggin) {
    } else {
      try {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        print(userCredential);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
// ..
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Помилка автентифікації'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Мій Акаунт'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  bottom: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                color: Theme.of(context).colorScheme.onBackground,
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'електронна пошта',
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                errorStyle: const TextStyle(color: Colors.red)),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Введіть коректний емейл адрес.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                          TextFormField(
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                                labelText: 'пароль',
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                errorStyle: const TextStyle(color: Colors.red)),
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Введіть коректний пароль.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _submit();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                            child: Text(
                              _isLoggin ? 'Реєстрація' : 'Увійти',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLoggin = !_isLoggin;
                                });
                              },
                              child: Text(
                                _isLoggin
                                    ? 'Я вже зареєстрований'
                                    : 'Створити акаунт',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
