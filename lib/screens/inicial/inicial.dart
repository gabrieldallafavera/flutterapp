import 'package:appflutter/screens/barra_navegacao/superior.dart';
import 'package:appflutter/screens/menu/lateral.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Inicial';

class Inicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: BarraNavegacaoSuperior(_tituloAppBar, AppBar()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/flutter_logo.png'),
          ),
        ],
      ),
      //bottomNavigationBar: BarraNavegacaoInferior(),
    );
  }
}
