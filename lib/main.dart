import 'package:flutter/material.dart';
import 'package:flutter_archive/application/context.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  setupServiceLocator();
  runApp(const CoreApplication());
}

class CoreApplication extends StatelessWidget {
  const CoreApplication({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Archive App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: CentralHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}


