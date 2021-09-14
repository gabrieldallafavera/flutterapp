import 'package:flutter/material.dart';

class Carregamento extends StatelessWidget {
  final String mensagem;

  Carregamento({this.mensagem = 'Carregando...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(mensagem),
        ],
      ),
    );
  }
}
