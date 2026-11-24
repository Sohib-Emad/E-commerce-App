import 'package:eco/core/widgets/app_search_field.dart';
import 'package:eco/core/widgets/product_card.dart';
import 'package:eco/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(const MyApp());
}

void main() {
  testWidgets('home screen shows products and opens search', (tester) async {
    await pumpApp(tester);

    expect(find.text('Delivery address'), findsOneWidget);
    expect(find.text('Recent product'), findsOneWidget);

    await tester.tap(find.byType(AppSearchField));
    await tester.pumpAndSettle();

    expect(find.text('Last search'), findsOneWidget);
  });

  testWidgets('search filters products by name', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.byType(AppSearchField));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(AppSearchField), 'mug');
    await tester.pumpAndSettle();

    expect(find.text('Aestechic Mug - white'), findsOneWidget);
    expect(find.textContaining('Search result for'), findsOneWidget);
  });

  testWidgets('product card opens the product details screen', (tester) async {
    await pumpApp(tester);

    final card = find.byWidgetPredicate(
      (widget) =>
          widget is ProductCard &&
          widget.product.name == 'Aestechic Mug - white',
    );
    await tester.scrollUntilVisible(
      card,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(card);
    await tester.pumpAndSettle();

    expect(find.text('Product Details'), findsOneWidget);
    expect(find.text('\$ 19.99'), findsOneWidget);
  });
}
