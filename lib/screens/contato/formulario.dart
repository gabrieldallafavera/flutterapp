import 'package:appflutter/database/dao/contado_dao.dart';
import 'package:appflutter/models/contato.dart';
import 'package:appflutter/screens/barra_navegacao/superior.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Novo Contato';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _contaController = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraNavegacaoSuperior(_tituloAppBar, AppBar()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _contaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numero Conta'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text('Criar'),
                  onPressed: () {
                    final String nome = _nomeController.text;
                    final int? conta = int.tryParse(_contaController.text);
                    final Contato contato = Contato(0,  nome, conta);
                    _dao.save(contato).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
