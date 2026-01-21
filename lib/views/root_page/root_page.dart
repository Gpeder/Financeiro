import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/views/home_page.dart';
import 'package:finceiro_app/views/perfil_page.dart';
import 'package:finceiro_app/views/transacoes_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TransacoesPage(),
    const PerfilPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: NavigationBar(
          labelTextStyle: WidgetStatePropertyAll(
            AppTextStyles.text14.copyWith(color: AppColors.foreground),
          ),
          backgroundColor: AppColors.card,
          indicatorColor: AppColors.primary.withValues(alpha: 0.2),
          selectedIndex: _selectIndex,
          animationDuration: const Duration(milliseconds: 300),
          height: 80,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (index) {
            setState(() {
              _selectIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              tooltip: 'Dashboard',
              icon: Icon(Icons.dashboard_outlined, size: 32),
              selectedIcon: Icon(
                Icons.dashboard,
                color: AppColors.primary,
                size: 32,
              ),
              label: 'Dashboard',
            ),
            NavigationDestination(
              tooltip: 'Transações',
              icon: Icon(Icons.list_alt_outlined, size: 32),
              selectedIcon: Icon(
                Icons.list_alt,
                color: AppColors.primary,
                size: 32,
              ),
              label: 'Transações',
            ),
            NavigationDestination(
              tooltip: 'Perfil',
              icon: Icon(Icons.person_outline, size: 32),
              selectedIcon: Icon(
                Icons.person,
                color: AppColors.primary,
                size: 32,
              ),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
