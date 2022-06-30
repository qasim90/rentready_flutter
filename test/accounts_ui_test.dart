import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rentready_flutter/main.dart';

import 'package:rentready_flutter/views/widgets/layout_switcher.dart';
import 'package:rentready_flutter/views/widgets/preloader.dart';

void main() {
  testWidgets('Initial accounts page UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify preloader is shown at very start of app
    expect(find.byType(Preloader), findsOneWidget);

    // Verify initial UI arrangment
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(LayoutSwitcher), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byIcon(Icons.filter_alt), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);

    // Test switching to grid view
    await tester.tap(find.byIcon(Icons.grid_view));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byType(ListView), findsNothing);
    expect(find.byType(GridView), findsOneWidget);

    // Test switching to list view from grid view
    await tester.tap(find.byIcon(Icons.format_list_bulleted));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
  });
}
