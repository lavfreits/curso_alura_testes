import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

//passo a passo para gerar o mock
//todo 1 - adicionar a dependencia mockito e do build runner (esse é debaixo de flutter lints) no pubspec.yaml
//todo 2 - colocar o nome da classe que vai ser mockada >> no generate mocks
//todo 3 - rodar o comando flutter pub run build_runner build ou dart run build_runner build
//todo 4 - pode precisar mover a classe a qual quer criar um mock pra pasta test
//todo 5 - na main faz isso: Home( api: BankHttp().dolarToReal(),)), >> faz com q o valor (nesse caso bank http) seja passado como parametro
//todo 6 - ai agr vai pro arquivo de test

@GenerateMocks([BankHttp])
class BankHttp {
  Future<String> dolarToReal() async {
    var url = Uri.http('economia.awesomeapi.com.br', '/last/USD-BRL');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      String value = jsonResponse['USDBRL']['high'];
      return value;
    } else {
      print('Não foi possível se conectar com a API: ${response.statusCode}');
      return '?';
    }
  }
}
