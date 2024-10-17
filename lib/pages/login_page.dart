import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onSuccess});

  final Function() onSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  _login() async {
    String username = _username.text.trim();
    String password = _password.text.trim();

    if (username == 'username' && password == 'password') {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('logged_in', true);

      widget.onSuccess.call();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Wrong username or password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login page'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _username,
              decoration: const InputDecoration(
                labelText: 'Username'
              ),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  _login();
                },
                child: const Text('Login')
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Username: "username"\nPassword: "password"',
            ),
          ],
        )
    );
  }
}
