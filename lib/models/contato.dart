class Contato {
  final int id;
  final String nome;
  final int? conta;

  Contato(this.id, this.nome, this.conta);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, conta: $conta}';
  }

  Contato.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        nome = json['name'],
        conta = json['accountNumber'];

  Map<String, dynamic> toJson() => {
        'name': nome,
        'accountNumber': conta,
      };
}
