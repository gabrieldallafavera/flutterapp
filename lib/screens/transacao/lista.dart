import 'package:appflutter/components/carregamento.dart';
import 'package:appflutter/http/webclient.dart';
import 'package:appflutter/models/transacao.dart';
import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transacao>>(
        future: findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Carregamento();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Transacao> transacoes =
                  snapshot.data as List<Transacao>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transacao transaction = transacoes[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(
                        transaction.valor.toString(),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        transaction.contato.conta.toString(),
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transacoes.length,
              );
          }
          return Text('Unknown erro');
        },
      ),
    );
  }
}
