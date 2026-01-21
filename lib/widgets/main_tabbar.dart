import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';

class MainTab extends StatefulWidget {
  final List<String> labels;
  final List<Widget> contents;

  const MainTab({super.key, required this.labels, required this.contents});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            color: AppColors.input,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: List.generate(widget.labels.length, (index) {
              final bool isSelected = _selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.secondary : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: .05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Text(
                      widget.labels[index],
                      textAlign: TextAlign.center,
                      style: isSelected ?
                          AppTextStyles.text16Bold
                          : AppTextStyles.text16,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        widget.contents[_selectedIndex],
      ],
    );
  }
}
