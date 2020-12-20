import 'dart:io';

bool isNumber(String s) {
  if(s == null)
    return false;
  return int.tryParse(s) != null;
}

void  badRequest(HttpResponse res, HttpRequest req) {
  res
    ..statusCode = HttpStatus.methodNotAllowed
    ..write('Unsupported request ${req.method} or unsupported path ${req.uri.path}\nGood request : GET /password')
    ..close();
}

void addCorsHeaders(HttpResponse res) {
  res.headers
    ..add('Access-Control-Allow-Origin', '*')
    ..add('Access-Control-Allow-Methods', 'GET')
    ..add('Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept');
}