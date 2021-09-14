import 'package:flutter/material.dart';

class BarraNavegacaoSuperior extends StatelessWidget implements PreferredSizeWidget {

  final String _tituloAppBar;
  final AppBar _appBar;

  const BarraNavegacaoSuperior(this._tituloAppBar, this._appBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(_tituloAppBar),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(_appBar.preferredSize.height);
}
