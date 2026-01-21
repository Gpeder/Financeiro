import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/views/home_page.dart';
import 'package:finceiro_app/views/root_page/root_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinceiroApp());
}

class FinceiroApp extends StatelessWidget {
  const FinceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const RootPage(),
    );
  }
}
