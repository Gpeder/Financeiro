import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_form.dart';
import 'package:finceiro_app/widgets/main_tabbar.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Column(
        children: [
          MainTab(
            labels: ['Despesas', 'Receita'],
            contents: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MainForm(
                      label: 'Valor',
                      prefixIcon: Icon(Icons.attach_money),
                      keyboardType: TextInputType.number,
                      inputFormatters: [],
                      controller: TextEditingController(),
                      validator: (value) => 'Campo obrigatório',
                      hint: 'R\$ 0,00',
                    ),
                    SizedBox(height: 16),
                    MainForm(
                      label: 'Descrição',
                      keyboardType: TextInputType.text,
                      controller: TextEditingController(),
                      validator: (value) => 'Campo obrigatório',
                      hint: 'Ex: Supermercado, farmácia, etc...',
                    ),
                  ],
                ),
              ),
              Text('Configurações'),
            ],
          ),
        ],
      ),
    );
  }
}
