import 'package:flutter/material.dart';

class LinkMenu extends StatelessWidget {
  final String nomeLink;
  final IconData icone;
  final Function onClick;

  LinkMenu(this.nomeLink, this.icone, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icone),
      title: Text(nomeLink),
      onTap: () => onClick(),
    );
  }
}
