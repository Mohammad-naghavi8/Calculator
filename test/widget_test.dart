// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator/main.dart';

void main() {
  testWidgets('calculator form is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('First number'), findsOneWidget);
    expect(find.text('Second number'), findsOneWidget);
    expect(find.text('Operation'), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);
    expect(find.text('Enter a number'), findsNWidgets(2));
    expect(find.text('Flutter TextField + function practice'), findsOneWidget);
  });

  testWidgets('calculator fits a narrow phone screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Simple Calculator'), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('calculator card uses the reference size', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(436, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());

    final cardSize = tester.getSize(find.byKey(const Key('calculator-card')));
    expect(cardSize, const Size(380, 423));
  });
}
