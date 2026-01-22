import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ListaFiltro extends StatelessWidget {
  ListaFiltro({super.key});

  final Map<String, bool> categoriasSelecionadas = {
    'Todas': true,
    'Alimentação': false,
    'Transporte': false,
    'Moradia': false,
    'Saúde': false,
    'Educação': false,
    'Lazer': false,
    'Compras': false,
    'Assinaturas': false,
    'Viagem': false,
    'Investimentos': false,
    'Contas': false,
    'Outros': false,
  };

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: RawScrollbar(
        trackColor: AppColors.border,
        trackRadius: const Radius.circular(10),
        padding: const EdgeInsets.only(top: 10),
        thumbColor: AppColors.primary,
        trackVisibility: true,
        interactive: true,
        thickness: 5,
        radius: const Radius.circular(10),
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: categoriasSelecionadas.length,
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final categoria = categoriasSelecionadas.keys.elementAt(index);
            final isSelected = categoriasSelecionadas[categoria]!;
            return FiltroCategorias(
              categoria: categoria,
              selected: isSelected,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

class FiltroCategorias extends StatelessWidget {
  final String categoria;
  final bool selected;
  final VoidCallback? onTap;
  const FiltroCategorias({
    super.key,
    required this.categoria,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = selected
        ? AppColors.primary
        : AppColors.primary.withValues(alpha: 0.2);
    final textColor = selected ? AppColors.onPrimary : AppColors.foreground;

    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          categoria,
          style: AppTextStyles.text16.copyWith(color: textColor),
        ),
        backgroundColor: backgroundColor,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
