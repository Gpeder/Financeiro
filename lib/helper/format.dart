import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Mascaras {
  static MaskTextInputFormatter get cpf => MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter get data => MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter get telefoneCompleto => MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter get ddd =>
      MaskTextInputFormatter(mask: '(##)', filter: {"#": RegExp(r'[0-9]')});

  static MaskTextInputFormatter get telefone => MaskTextInputFormatter(
    mask: '#####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter get cep => MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static TextInputFormatter get moeda => CurrencyInputFormatter();
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) {
      return const TextEditingValue(text: '');
    }

    final value = double.parse(digits) / 100;
    final formatted = _format(value);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _format(double value) {
    final parts = value.toStringAsFixed(2).split('.');
    final inteiro = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]}.',
    );
    return '$inteiro,${parts[1]}';
  }
}

class Formatador {
  static String moedabr(double valor) {
    if (valor == 0) return '0,00';

    String valorString = valor.toStringAsFixed(2);
    List<String> parts = valorString.split('.');

    String wholePart = parts[0];
    String decimalPart = parts[1];

    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(Match match) => '${match[1]}.';

    wholePart = wholePart.replaceAllMapped(reg, mathFunc);

    return '$wholePart,$decimalPart';
  }
}
