import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_providers/src/providers/list_provider.dart';

import 'src/features/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ListProvider())],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
