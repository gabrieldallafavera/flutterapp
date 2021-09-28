import 'package:flutter/material.dart';

class TransacaoAuthDialog extends StatefulWidget {
  final Function(String) onConfirmar;

  TransacaoAuthDialog({required this.onConfirmar});

  @override
  State<TransacaoAuthDialog> createState() => _TransacaoAuthDialogState();
}

class _TransacaoAuthDialogState extends State<TransacaoAuthDialog> {
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Auteticador'),
      content: TextField(
        controller: _senhaController,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 64, letterSpacing: 24),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirmar(_senhaController.text);
            Navigator.pop(context);
          },
          child: Text('Aceitar'),
        )
      ],
    );
  }
}
