import 'dart:convert';

import 'package:appflutter/http/webclient.dart';
import 'package:appflutter/models/transacao.dart';
import 'package:http/http.dart';

class TransacaoWebClient {
  Future<List<Transacao>> findAll() async {
    final Response response =
        await client.get(uri).timeout(Duration(seconds: 5));

    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Transacao.fromJson(json)).toList();
  }

  Future<Transacao> save(Transacao transacao) async {
    final Response response = await client.post(uri,
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: jsonEncode(transacao.toJson()));

    return Transacao.fromJson(jsonDecode(response.body));
  }
}
