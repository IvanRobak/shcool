import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoggin = false;
  bool _isPasswordVisible = false;
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: 'електронна пошта',
                                labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background)),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                          ),
                          TextFormField(
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: 'пароль',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background),
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
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {},
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
