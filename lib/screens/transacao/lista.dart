import 'package:appflutter/components/carregamento.dart';
import 'package:appflutter/components/mensagem_centralizada.dart';
import 'package:appflutter/http/webclients/transacao_webclient.dart';
import 'package:appflutter/models/transacao.dart';
import 'package:appflutter/screens/menu/lateral.dart';
import 'package:flutter/material.dart';

class ListaTransacoes extends StatelessWidget {
  final TransacaoWebClient _webClient = TransacaoWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: Text('Transações'),
      ),
      body: FutureBuilder<List<Transacao>>(
        future: _webClient.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Carregamento();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transacao> transacoes =
                    snapshot.data as List<Transacao>;
                if (transacoes.isNotEmpty) {
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
              }
              return MensagemCentralizada('Nenhuma transação encontrada',
                  icone: Icons.warning);
          }
          return MensagemCentralizada('Unknown erro');
        },
      ),
    );
  }
}
