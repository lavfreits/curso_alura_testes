import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'bank_http.mocks.dart';

void main() {
  //todo 6 - criamos uma instancia do mock
  final mockHttp = MockBankHttp();

  testWidgets('My widget has a text "Spent"', (tester) async {
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
        )),
      ),
    );
    final spentFinder = find.text('Spent');

    expect(spentFinder, findsOneWidget);
  });

  testWidgets('Finds  a linear progress indicator', (tester) async {
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
        )),
      ),
    );

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('Finds a Account status', (tester) async {
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
        )),
      ),
    );

    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('Testing MockHttp dolarToReal', (tester) async {
    //todo 7 - isso é um stub necessario quando espera q retorne um valor >> aqui setamos p retornar 5
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
          //todo 8 - aqui passamos o mock como parametro
        )),
      ),
    );
    //todo 9 - aqui verificamos se o metodo foi chamado 1 vez > depende de quantas vezes foi chamado no projeto
    verify(mockHttp.dolarToReal()).called(4);

    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('Finds 5 boxcards', (tester) async {
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
        )),
      ),
    );

    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });

  testWidgets('when tap Deposit should upload earned in 10 ', (tester) async {
    when(mockHttp.dolarToReal()).thenAnswer((_) async => '5.0');
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
            child: Home(
          api: mockHttp.dolarToReal(),
        )),
      ),
    );

    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);
  });
}
