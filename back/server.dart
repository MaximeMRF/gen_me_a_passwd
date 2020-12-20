import 'dart:convert';
import 'dart:io';
import 'server_func.dart';

/*
 *
 *  Pls generate me a passwd !
 *  github.com/MaximeMRF
 *  
 */

void  handleGet(HttpRequest req) async {
  HttpResponse res = req.response;
  String password = "error";

  if (req.uri.query == "") {
    password = Process.runSync('./gen_passwd', ['12']).stdout;
  } else {
      List<String> params = req.uri.query.split('=');
      if (params.length == 2 && params[0] == 'len' && params[1].length > 0 && params[1].length < 5 && isNumber(params[1])) {
          password = Process.runSync('./gen_passwd', [params[1]]).stdout;
      }
  }
  addCorsHeaders(res);
  res.headers.add(HttpHeaders.contentTypeHeader, "application/json");
  res.write(json.encode({ "password": password }));
  await res.close();
}

void  handleRequest(HttpRequest req) {
  try {
    if (req.method == 'GET'  && req.uri.path.startsWith('/password'))
      handleGet(req);
    else
      badRequest(req.response, req);
  } catch (e) {
    print(e);
  }
}
Future main(List<String> args) async {
  int port = 8080;
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    port,
  );
  
  print('Server port: ${server.port}\nServer Host: ${server.address.host}\nServer Address: ${server.address.address}');

  await for (HttpRequest req in server) {
    handleRequest(req);
  }
}