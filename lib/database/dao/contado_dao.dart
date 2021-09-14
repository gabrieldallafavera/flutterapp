import 'package:appflutter/database/app_database.dart';
import 'package:appflutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {
  static const String sqlTabela = 'CREATE TABLE $_nomeTabela('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_conta INTEGER)';

  static const String _nomeTabela = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _conta = 'conta';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> mapaContato = _toMap(contato);
    return db.insert(_nomeTabela, mapaContato);
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_nomeTabela);
    List<Contato> contatos = _toList(result);
    return contatos;
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> mapaContato = Map();
    mapaContato[_nome] = contato.nome;
    mapaContato[_conta] = contato.conta;
    return mapaContato;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> row in result) {
      final Contato contato = Contato(row[_id], row[_nome], row[_conta]);
      contatos.add(contato);
    }
    return contatos;
  }
}
