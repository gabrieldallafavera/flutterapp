import 'package:appflutter/screens/contato/lista.dart';
import 'package:appflutter/screens/menu/components/link.dart';
import 'package:appflutter/screens/inicial.dart';
import 'package:appflutter/screens/transacao/lista.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.orange[600],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('lib/assets/flutter_logo.png'),
              ),
            ),
          ),
          LinkMenu(
            'Inicio',
            Icons.home,
            onClick: () =>
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Inicial()),
                ),
          ),
          LinkMenu(
            'Contatos',
            Icons.monetization_on,
            onClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListaContatos()),
              ),
          ),
          LinkMenu(
            'Transações',
            Icons.description,
            onClick: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ListaTransacoes()),
            ),
          ),
        ],
      ),
    );
  }
}
