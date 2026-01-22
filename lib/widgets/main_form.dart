import 'package:finceiro_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MainForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const MainForm({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.text16.copyWith(color: AppColors.onMuted),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          onTap: onTap,
          readOnly: readOnly,
          focusNode: focusNode,
          style: AppTextStyles.text16.copyWith(color: AppColors.foreground),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                AppTextStyles.text14.copyWith(color: AppColors.onMuted),
            filled: true,
            fillColor: AppColors.input,
            isDense: true,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.destructive, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.destructive, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}


class MainSelect<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;

  const MainSelect({
    super.key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.text16.copyWith(color: AppColors.onMuted),
          ),
          const SizedBox(height: 6),
        ],
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items,
          onChanged: enabled ? onChanged : null,
          validator: validator,
          icon: suffixIcon ??
              const Icon(Icons.keyboard_arrow_down_rounded,
                  color: AppColors.onMuted),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                AppTextStyles.text14.copyWith(color: AppColors.onMuted),
            filled: true,
            fillColor: AppColors.input,
            isDense: true,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            prefixIcon: prefixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.destructive, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: AppColors.destructive, width: 2),
            ),
          ),
          dropdownColor: AppColors.card,
          style: AppTextStyles.text16.copyWith(color: AppColors.foreground),
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}

class MainDatePicker extends StatelessWidget {
  final String? label;
  final String? hint;
  final DateTime? value;
  final ValueChanged<DateTime?>? onChanged;
  final String? Function(DateTime?)? validator;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final DateFormat? formatter;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const MainDatePicker({
    super.key,
    this.label,
    this.hint,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.formatter,
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: value != null
          ? (formatter ?? DateFormat('dd/MM/yyyy')).format(value!)
          : '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppTextStyles.text16.copyWith(color: AppColors.onMuted),
          ),
          const SizedBox(height: 6),
        ],
        FormField<DateTime>(
          initialValue: value,
          validator: validator,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller,
                  readOnly: true,
                  enabled: enabled,
                  style: AppTextStyles.text16.copyWith(color: AppColors.foreground),
                  decoration: InputDecoration(
                    hintText: hint ?? 'Selecione uma data',
                    hintStyle:
                        AppTextStyles.text14.copyWith(color: AppColors.onMuted),
                    filled: true,
                    fillColor: AppColors.input,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon ??
                        const Icon(Icons.calendar_today_rounded,
                            color: AppColors.onMuted),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors.destructive, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors.destructive, width: 2),
                    ),
                    errorText: state.errorText,
                  ),
                  onTap: enabled
                      ? () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: value ?? DateTime.now(),
                            firstDate: firstDate ?? DateTime(1900),
                            lastDate: lastDate ?? DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.dark(
                                    primary: AppColors.primary,
                                    onPrimary: AppColors.onPrimary,
                                    surface: AppColors.card,
                                    onSurface: AppColors.foreground,
                                  ), dialogTheme: DialogThemeData(backgroundColor: AppColors.card),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (picked != null) {
                            state.didChange(picked);
                            onChanged?.call(picked);
                          }
                        }
                      : null,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}



class MainSearchBar extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const MainSearchBar({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: keyboardType,
      style: AppTextStyles.text16.copyWith(color: AppColors.foreground),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint ?? 'Buscar...',
        hintStyle: AppTextStyles.text14.copyWith(color: AppColors.onMuted),
        filled: true,
        fillColor: AppColors.input,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        prefixIcon: prefixIcon ??
            const Icon(Icons.search_rounded, color: AppColors.onMuted),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: AppColors.primary, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}