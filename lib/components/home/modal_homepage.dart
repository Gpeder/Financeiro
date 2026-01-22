import 'package:finceiro_app/widgets/main_form.dart';
import 'package:finceiro_app/widgets/main_tabbar.dart';
import 'package:flutter/material.dart';

class MainModal extends StatelessWidget {
  const MainModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: MainTab(
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
                  SizedBox(height: 16),
                  MainSelect(
                    label: 'Categoria',
                    value: 'Outros',
                    onChanged: (value) {},
                    validator: (value) => 'Campo obrigatório',
                    items: [
                      DropdownMenuItem(
                        value: 'Alimentação',
                        child: Text('Alimentação'),
                      ),
                      DropdownMenuItem(
                        value: 'Transporte',
                        child: Text('Transporte'),
                      ),
                      DropdownMenuItem(value: 'Lazer', child: Text('Lazer')),
                      DropdownMenuItem(value: 'Saúde', child: Text('Saúde')),
                      DropdownMenuItem(value: 'Educação', child: Text('Educação')),
                      DropdownMenuItem(value: 'Moradia', child: Text('Moradia')),
                      DropdownMenuItem(value: 'Outros', child: Text('Outros')),
                    ],
                    hint: 'Selecione uma categoria',
                  ),
                  SizedBox(height: 16),
                  MainDatePicker(
                    label: 'Data',
                    validator: (value) => 'Campo obrigatório',
                    prefixIcon: Icon(Icons.calendar_today),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    value: DateTime.now(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Text('Salvar Despesa')),
                ],
              ),
            ),
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
                    hint: 'Ex: Salário, bônus, etc...',
                  ),
                  SizedBox(height: 16),
                  MainSelect(
                    label: 'Categoria',
                    value: 'Outros',
                    onChanged: (value) {},
                    validator: (value) => 'Campo obrigatório',
                    items: [
                      DropdownMenuItem(value: 'Salário', child: Text('Salário')),
                      DropdownMenuItem(
                        value: 'Investimentos',
                        child: Text('Investimentos'),
                      ),
                      DropdownMenuItem(value: 'Bonus', child: Text('Bonus')),
        
                      DropdownMenuItem(value: 'Outros', child: Text('Outros')),
                    ],
                    hint: 'Selecione uma categoria',
                  ),
                  SizedBox(height: 16),
                  MainDatePicker(
                    label: 'Data',
                    validator: (value) => 'Campo obrigatório',
                    prefixIcon: Icon(Icons.calendar_today),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    value: DateTime.now(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Text('Salvar Receita')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}