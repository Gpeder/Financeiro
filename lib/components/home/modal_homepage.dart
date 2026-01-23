import 'package:finceiro_app/helper/format.dart';
import 'package:finceiro_app/service/service.dart';
import 'package:finceiro_app/widgets/main_form.dart';
import 'package:finceiro_app/widgets/main_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainModal extends StatefulWidget {
  const MainModal({super.key});

  @override
  State<MainModal> createState() => _MainModalState();
}

class _MainModalState extends State<MainModal> {
  final _formDespesasKey = GlobalKey<FormState>();
  final _formReceitasKey = GlobalKey<FormState>();

  final valorDespesasController = TextEditingController();
  final descricaoDespesasController = TextEditingController();

  final valorReceitasController = TextEditingController();
  final descricaoReceitasController = TextEditingController();

  String? categoriaDespesas;
  String? categoriaReceitas;

  DateTime? dataDespesas = DateTime.now();
  DateTime? dataReceitas = DateTime.now();

  @override
  void dispose() {
    valorDespesasController.dispose();
    descricaoDespesasController.dispose();
    valorReceitasController.dispose();
    descricaoReceitasController.dispose();
    super.dispose();
  }

  double _parseMoeda(String value) {
    return double.tryParse(value.replaceAll('.', '').replaceAll(',', '.')) ?? 0;
  }

  Future<void> salvarDespesa() async {
    if (!_formDespesasKey.currentState!.validate()) return;

    final dados = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'titulo': descricaoDespesasController.text,
      'valor': _parseMoeda(valorDespesasController.text),
      'descricao': descricaoDespesasController.text,
      'categoria': categoriaDespesas,
      'data': dataDespesas,
      'isDespesa': true,
    };

    final service = TransacaoService();
    await service.salvar(dados);
    print('✅ Salvo no Hive com sucesso');
    print('💾 Salvando despesa: $dados');
  }

  Future<void> salvarReceita() async {
    if (!_formReceitasKey.currentState!.validate()) return;

    final dados = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'titulo': descricaoReceitasController.text,
      'valor': _parseMoeda(valorReceitasController.text),
      'descricao': descricaoReceitasController.text,
      'categoria': categoriaReceitas,
      'data': dataReceitas,
      'isDespesa': false,
    };

    final service = TransacaoService();
    await service.salvar(dados);
    print('✅ Salvo no Hive com sucesso');
    print('💾 Salvando receita: $dados');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MainTab(
              labels: const ['Receita', 'Despesa'],
              contents: [
                SingleChildScrollView(
                  child: Form(
                    key: _formReceitasKey,
                    child: Column(
                      children: [
                        MainForm(
                          label: 'Valor',
                          prefixIcon: const Icon(Ionicons.wallet),
                          keyboardType: TextInputType.number,
                          inputFormatters: [Mascaras.moeda],
                          controller: valorReceitasController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          hint: 'R\$ 0',
                        ),
                        const SizedBox(height: 16),

                        MainForm(
                          label: 'Descrição',
                          keyboardType: TextInputType.text,
                          controller: descricaoReceitasController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          hint: 'Ex: Salário, bônus, etc...',
                        ),
                        const SizedBox(height: 16),

                        MainSelect(
                          label: 'Categoria',
                          value: categoriaReceitas,
                          onChanged: (value) {
                            setState(() {
                              categoriaReceitas = value;
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          items: const [
                            DropdownMenuItem(
                              value: 'Salário',
                              child: Text('Salário'),
                            ),
                            DropdownMenuItem(
                              value: 'Investimentos',
                              child: Text('Investimentos'),
                            ),
                            DropdownMenuItem(
                              value: 'Bonus',
                              child: Text('Bonus'),
                            ),
                            DropdownMenuItem(
                              value: 'Outros',
                              child: Text('Outros'),
                            ),
                          ],
                          hint: 'Selecione uma categoria',
                        ),
                        const SizedBox(height: 16),

                        MainDatePicker(
                          label: 'Data',
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(Ionicons.calendar),
                          validator: (value) =>
                              value == null ? 'Campo obrigatório' : null,
                          onChanged: (value) {
                            setState(() {
                              dataReceitas = value;
                            });
                          },
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          value: dataReceitas,
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () async {
                            if (!_formReceitasKey.currentState!.validate())
                              return;
                            await salvarReceita();
                            if (!mounted) return;
                            Navigator.pop(context, true);
                          },
                          child: const Text('Salvar Receita'),
                        ),
                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  child: Form(
                    key: _formDespesasKey,
                    child: Column(
                      children: [
                        MainForm(
                          label: 'Valor',
                          prefixIcon: const Icon(Ionicons.wallet),
                          keyboardType: TextInputType.number,
                          inputFormatters: [Mascaras.moeda],
                          controller: valorDespesasController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          hint: 'R\$ 0',
                        ),
                        const SizedBox(height: 16),

                        MainForm(
                          label: 'Descrição',
                          keyboardType: TextInputType.text,
                          controller: descricaoDespesasController,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          hint: 'Ex: Supermercado, farmácia, etc...',
                        ),
                        const SizedBox(height: 16),

                        MainSelect(
                          label: 'Categoria',
                          value: categoriaDespesas,
                          onChanged: (value) {
                            setState(() {
                              categoriaDespesas = value;
                            });
                          },
                          validator: (value) => value == null || value.isEmpty
                              ? 'Campo obrigatório'
                              : null,
                          items: const [
                            DropdownMenuItem(
                              value: 'Alimentação',
                              child: Text('Alimentação'),
                            ),
                            DropdownMenuItem(
                              value: 'Transporte',
                              child: Text('Transporte'),
                            ),
                            DropdownMenuItem(
                              value: 'Lazer',
                              child: Text('Lazer'),
                            ),
                            DropdownMenuItem(
                              value: 'Saúde',
                              child: Text('Saúde'),
                            ),
                            DropdownMenuItem(
                              value: 'Educação',
                              child: Text('Educação'),
                            ),
                            DropdownMenuItem(
                              value: 'Moradia',
                              child: Text('Moradia'),
                            ),
                            DropdownMenuItem(
                              value: 'Outros',
                              child: Text('Outros'),
                            ),
                          ],
                          hint: 'Selecione uma categoria',
                        ),
                        const SizedBox(height: 16),

                        MainDatePicker(
                          onChanged: (value) {
                            setState(() {
                              dataDespesas = value;
                            });
                          },
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(Ionicons.calendar),
                          label: 'Data',
                          validator: (value) =>
                              value == null ? 'Campo obrigatório' : null,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          value: dataDespesas,
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton(
                          onPressed: () async {
                            if (!_formDespesasKey.currentState!.validate())
                              return;
                            await salvarDespesa();
                            if (!mounted) return;
                            Navigator.pop(context, true);
                          },
                          child: const Text('Salvar Despesa'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
