import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/views/root_page/root_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('transacoes');
  runApp(const FinceiroApp());
}

class FinceiroApp extends StatelessWidget {
  const FinceiroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Finceiro App',
      home: const RootPage(),
    );
  }
}
