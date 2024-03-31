import 'package:flutter/material.dart';
import 'package:fitguide_main/Page/Login/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const FitGuide());
}

class FitGuide extends StatelessWidget {
  const FitGuide({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'FitGuide',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
