import 'package:flutter/material.dart';

class BarraNavegacaoInferior extends StatefulWidget {
  @override
  State<BarraNavegacaoInferior> createState() => _BarraNavegacaoInferiorState();
}

class _BarraNavegacaoInferiorState extends State<BarraNavegacaoInferior> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'teste 1',
      style: optionStyle,
    ),
    Text(
      'teste 2',
      style: optionStyle,
    ),
    Text(
      'teste 3',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Transferências',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Contatos',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
