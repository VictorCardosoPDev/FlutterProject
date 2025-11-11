// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:gerenciamento_gado/main.dart';

void main() {
  testWidgets('App mostra Login e navega para Cadastro', (WidgetTester tester) async {
    // Inicializa o app real
    await tester.pumpWidget(const GerenciamentoGadoApp());

    // Aguarda frames iniciais
    await tester.pumpAndSettle();

    // Verifica se a tela de Login está sendo exibida
    expect(find.text('Login'), findsOneWidget);

    // Toca no botão 'Criar conta' para navegar para a página de cadastro
    expect(find.text('Criar conta'), findsOneWidget);
    await tester.tap(find.text('Criar conta'));
    await tester.pumpAndSettle();

    // Após navegação, deve mostrar a tela de Cadastro
    expect(find.text('Cadastro'), findsOneWidget);
  });
}
