import 'package:appflutter/models/contato.dart';

class Transacao {
  final double valor;
  final Contato contato;

  Transacao(this.valor, this.contato);

  @override
  String toString() {
    return 'Transaction{valor: $valor, contato: $contato}';
  }
}
