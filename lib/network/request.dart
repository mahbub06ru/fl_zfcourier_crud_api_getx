import 'package:http/http.dart' as http;

const urlBase = 'https://demo.zfcourier.xyz/api/v/1.0.0/';

class Request{
  final String url;
  final dynamic body;
  final dynamic header;

  Request({required this.url,this.body,this.header});

  Future<http.Response> get(){
    print(urlBase+url);
    return http.get(Uri.parse(urlBase+url),headers: header).timeout(Duration(minutes: 2));
  }
  Future<http.Response> post() {
    return http.post(Uri.parse(urlBase+url),headers: header, body: body).timeout(Duration(minutes: 2));
  }

  Future<http.Response> delete(){
    print(urlBase+url);
    return http.delete(Uri.parse(urlBase+url),headers: header).timeout(Duration(minutes: 2));
  }



}

