import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/instance_manager.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rentready_flutter/api/api_client.dart';
import 'package:rentready_flutter/main.dart';
import 'package:rentready_flutter/views/pages/account_detail_page.dart';
import 'package:rentready_flutter/views/widgets/account_list_item.dart';
import 'package:rentready_flutter/views/widgets/filters_popup.dart';

import 'package:rentready_flutter/views/widgets/layout_switcher.dart';
import 'package:rentready_flutter/views/widgets/preloader.dart';

import 'api_provider_test.dart';
import 'sample_data.dart';

void main() {
  MockApiClient apiClient = Get.put<Api>(MockApiClient()) as MockApiClient;

  setUpAll(() {
    // Intercept getAccounts api call and return mocked accounts.
    // getAccounts url should contain name accountnumber params in query string.
    when(() => apiClient.get_(any(that: contains('\$select=name,accountnumber'))))
        .thenAnswer((_) => Future.value(mockAccountsResponse));

    // Intercept fetchAllStates api call and return mocked states response.
    // fetchAllStates url selects only address1_stateorprovince in query string.
    when(() => apiClient.get_(any(that: contains('\$select=address1_stateorprovince&'))))
        .thenAnswer((_) => Future.value(mockStatesResponse));

    // Return empty array when filtering by stateOrProvince "WA"
    when(() => apiClient.get_(any(that: contains('\'address1_stateorprovince\', PropertyValues=["WA"]'))))
        .thenAnswer((_) => Future.value({'value': []}));
  });

  testWidgets('Initial accounts page UI', (WidgetTester tester) async {
    when(() => apiClient.get_(any())).thenAnswer((_) => Future.value(mockAccountsResponse));

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
  });

  testWidgets("Test list/grid view toggling", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

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

  testWidgets("Test search accounts and tap to open detail page", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    /// Find search textfield and enter query
    await tester.enterText(find.byType(TextField), 'Coffee');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Expect one or more AccountListItem rendered
    expect(find.byType(AccountListItem), findsWidgets);

    // Find the target InkWell widget by passing accountid as key
    await tester.tap(find.byKey(Key(mockAccounts.first.acctountId)));
    await tester.pumpAndSettle();

    // Expect the detail page opened
    expect(find.byType(AccountDetailPage), findsOneWidget);
  });

  testWidgets("Open filters popup, select filter and apply", (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Expect accounts list items displayed
    expect(find.byType(AccountListItem), findsWidgets);

    expect(find.byIcon(Icons.filter_alt), findsOneWidget);

    await tester.tap(find.byIcon(Icons.filter_alt));
    await tester.pumpAndSettle();

    // Expect filters popup opened
    expect(find.byType(FiltersPopup), findsOneWidget);

    await tester.tap(find.text('WA'));
    await tester.tap(find.byKey(const Key('applyBtn')));
    await tester.pumpAndSettle();

    // Expect filters popup gone
    expect(find.byType(FiltersPopup), findsNothing);

    // We've only one mocked account in "TX" state so filtering by "WA"
    // should result in no list items displayed
    expect(find.byType(AccountListItem), findsNothing);
  });
}
