import 'package:flutter/material.dart';
import 'package:fitguide_main/Services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Running login view");
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitGuide'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Forgot password button pressed'),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.blue),
                    )),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await AuthService.login(
                        email: "jrcumayas.code@gmail.com",
                        password: "admin007",
                        context: context,
                        ref: ref,
                      );
                      // email: emailController.text,
                      // password: passwordController.text);
                    },
                    child: const Text('Sign in'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Sign in Google button pressed'),
                          );
                        },
                      );
                    },
                    child: const Text('Sign in with Google'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Sign up button pressed'),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Don\'t have an account yet? Sign up',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
