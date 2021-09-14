import 'dart:convert';
import 'package:appflutter/models/contato.dart';
import 'package:appflutter/models/transacao.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LogginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Request');
    print('url: ${data.baseUrl}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}

Future<List<Transacao>> findAll() async {
  final Client client =
      InterceptedClient.build(interceptors: [LogginInterceptor()]);

  Uri uri = Uri.http('10.103.208.7:8080', 'transactions');
  final Response response = await client.get(uri).timeout(Duration(seconds: 5));

  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transacao> transacoes = [];

  for (Map<String, dynamic> transacaoJson in decodedJson) {
    final Map<String, dynamic> contatoJson = transacaoJson['contact'];

    final Transacao transacao = Transacao(
        transacaoJson['value'],
        Contato(
          0,
          contatoJson['name'],
          contatoJson['accountNumber'],
        ));

    transacoes.add(transacao);
  }

  return transacoes;
}
