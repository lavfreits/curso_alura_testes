import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //testes de unidade
  group('Bank model deposit tests', () {
    //descripition: local, metodo e resultado

    test('bank model deposit should turn points into 10', () {
      final bankModel = BankModel();

      bankModel.deposit(10);
      expect(bankModel.points, 10);
    });

    test('bank model deposit should turn available into 10', () {
      final bankModel = BankModel();

      bankModel.deposit(10);
      expect(bankModel.available, 10);
    });
  });
  test('bank model transfer should turn points into 10', () {
    final bankModel = BankModel();

    bankModel.transfer(10);
    expect(bankModel.points, 10);
  });
}
