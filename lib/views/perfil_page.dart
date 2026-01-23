import 'package:finceiro_app/components/perfil/configuracoes_tema.dart';
import 'package:finceiro_app/components/perfil/dados_usuario.dart';
import 'package:finceiro_app/components/perfil/resumo_mensal.dart';
import 'package:finceiro_app/theme/theme.dart';
import 'package:finceiro_app/widgets/main_buttons.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final GlobalKey<ResumoMensalState> _resumoKey = GlobalKey();

  Future<void> _atualizarDados() async {
    _resumoKey.currentState?.carregarDados();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perfil',
              style: AppTextStyles.text24Bold.copyWith(
                color: AppColors.foreground,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Gerencie suas informações pessoais',
              style: AppTextStyles.text18.copyWith(color: AppColors.foreground),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _atualizarDados,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 20),
              DadosUsuario(),
              SizedBox(height: 20),
              ResumoMensal(key: _resumoKey),
              SizedBox(height: 20),
              ConfiguracoesTema(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: MainOutlinedButton(
                  label: 'Sair da conta',
                  icon: Ionicons.log_out_outline,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
