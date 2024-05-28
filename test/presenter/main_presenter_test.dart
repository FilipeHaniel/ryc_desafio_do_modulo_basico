import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/presenter/main_presenter.dart';
import 'package:ryc_desafio_do_modulo_basico/presentation/view/pages/home_page.dart';

class MockPresenter extends Mock implements MainPresenter {}

void main() {
  group('presenter select page 1', () {
    late MainPresenter presenter;

    setUp(() {
      presenter = MockPresenter();
    });

    test('Success', () async {

      Widget response = const HomePage();

      when(() => presenter.selectPage(0)).thenReturn(response);

      expect(presenter.selectPage(0), response);

      verify(() => presenter.selectPage(0)).called(1);
    });
  });

  group('presenter select page 2', () {
    late MainPresenter presenter;

    setUp(() {
      presenter = MockPresenter();
    });

    test('Success', () async {

      Widget response = const Text('');

      when(() => presenter.selectPage(1)).thenReturn(response);

      expect(presenter.selectPage(1), response);

      verify(() => presenter.selectPage(1)).called(1);
    });
  });
}
