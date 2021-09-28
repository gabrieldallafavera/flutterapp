import 'package:appflutter/http/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(interceptors: [LogginInterceptor()]);

final Uri uri = Uri.http('10.103.208.7:8080', 'transactions');


