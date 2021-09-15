import 'package:appflutter/components/carregamento.dart';
import 'package:appflutter/database/dao/contado_dao.dart';
import 'package:appflutter/models/contato.dart';
import 'package:appflutter/screens/barra_navegacao/superior.dart';
import 'package:appflutter/screens/contato/formulario.dart';
import 'package:appflutter/screens/menu/lateral.dart';
import 'package:appflutter/screens/transacao/formulario.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Lista de Contatos';

class ListaContatos extends StatefulWidget {
  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: BarraNavegacaoSuperior(_tituloAppBar, AppBar()),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Carregamento();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data as List<Contato>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return _ItemContato(
                    contato,
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FormularioTransacao(contato)));
                    },
                  );
                },
                itemCount: contatos.length,
              );
          }
          return Text('Unknown Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(builder: (context) => FormularioContato()),
              )
              .then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ItemContato extends StatelessWidget {
  final Contato contato;
  final Function onClick;

  _ItemContato(this.contato, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contato.conta.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
