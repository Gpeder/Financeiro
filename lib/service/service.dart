import 'package:hive/hive.dart';

class TransacaoService {
  final Box _box = Hive.box('transacoes');

  Future<void> salvar(Map<String, dynamic> dados) async {
    try {
      print('🟢 Salvando transação: $dados');
      await _box.add(dados);
      print('✅ Transação salva com sucesso');
    } catch (e) {
      print('❌ Erro ao salvar transação: $e');
      rethrow;
    }
  }

  List<Map<String, dynamic>> buscarTodas() {
    try {
      print('🔍 Buscando todas as transações');
      final result = _box.values
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
      print('✅ ${result.length} transações encontradas');
      return result;
    } catch (e) {
      print('❌ Erro ao buscar transações: $e');
      return [];
    }
  }

  Future<void> deletar(int index) async {
    try {
      print('🗑️ Deletando transação no índice: $index');
      await Hive.box('transacoes').deleteAt(index);
      print('✅ Transação deletada');
    } catch (e) {
      print('❌ Erro ao deletar transação: $e');
      rethrow;
    }
  }

  Future<void> atualizar(int index, Map<String, dynamic> dados) async {
    try {
      print('✏️ Atualizando transação no índice: $index');
      print('📦 Novos dados: $dados');
      await Hive.box('transacoes').putAt(index, dados);
      print('✅ Transação atualizada');
    } catch (e) {
      print('❌ Erro ao atualizar transação: $e');
      rethrow;
    }
  }

  Map<String, dynamic> buscar(int index) {
    try {
      print('🔎 Buscando transação no índice: $index');
      final result = Hive.box('transacoes').getAt(index);
      print('✅ Transação encontrada: $result');
      return result;
    } catch (e) {
      print('❌ Erro ao buscar transação: $e');
      rethrow;
    }
  }
}
