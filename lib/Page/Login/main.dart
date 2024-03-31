import 'package:flutter/material.dart';
import 'package:fitguide_main/Page/Login/login.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Text('Hello World'),
        const SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginView())
              );
            },
            child: const Text("Sign In"))
      ],
    )));
  }
}
