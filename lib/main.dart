import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'pages/home/page.home.dart';
import 'providers/provider.medication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MedicationProvider(),
      child: MaterialApp(
        title: 'NotSan-Taschenbuch',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}
