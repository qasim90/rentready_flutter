import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rentready_flutter/api/api_provider.dart';
import 'package:rentready_flutter/controllers/accounts_controller.dart';
import 'package:rentready_flutter/views/widgets/filters_popup.dart';

import 'sample_data.dart';

class MockApiProvider extends Mock implements ApiProvider {}

void main() {
  late MockApiProvider apiProvider;
  late AccountsController controller;

  setUp(() {
    apiProvider = MockApiProvider();
    controller = AccountsController(apiProvider);
  });

  test("List view selected by defult", () {
    expect(controller.isListView, true);
  });

  test("Switch to grid view. isListView should be false", () {
    controller.onLayoutToggle(1);
    expect(controller.isListView, false);
  });

  test("fetch all accounts", () async {
    when(() => apiProvider.getAccounts('', '')).thenAnswer((_) => Future.value(mockAccounts));

    await controller.fetchAccounts();

    expect(controller.accounts.length, 1);
  });

  test("fetch all accounts results in error", () async {
    when(() => apiProvider.getAccounts('', '')).thenThrow(Exception('error'));
    // print(await controller.fetchAccounts());
    expect(controller.fetchAccounts, prints('Exception: error\n'));
  });

  test("Initial value of filterOptions", () {
    expect(controller.filterOptions.length, 3);
  });

  test("fetch all statesOrProvinces", () async {
    // Test initial value of filterOptions variable which should contain 3 items
    final initOptions = controller.filterOptions.length;

    when(() => apiProvider.fetchAllStates()).thenAnswer((_) => Future.value(mockStates));

    await controller.fetchStatesOrProvinces();

    expect(controller.filterOptions.length, initOptions + mockStates.length + 1);
  });

  test("filter by statecode only", () async {
    var item = controller.filterOptions.value[2] as FilterOptionItem;
    item.option.selected = true;
    controller.applyFilters();

    expect(controller.filterQs.value, 'Microsoft.Dynamics.CRM.In(PropertyName=\'statecode\', PropertyValues=["1"])');
  });

  test("filter by stateOrProvince only", () async {
    // setup fake stateorprovince injection
    when(() => apiProvider.fetchAllStates()).thenAnswer((_) => Future.value(mockStates));

    await controller.fetchStatesOrProvinces();

    var item = controller.filterOptions.value[5] as FilterOptionItem;
    item.option.selected = true;
    controller.applyFilters();

    expect(controller.filterQs.value,
        'Microsoft.Dynamics.CRM.In(PropertyName=\'address1_stateorprovince\', PropertyValues=["${mockStates[1].value}"])');
  });

  test("filter by both statecode and stateOrProvince", () async {
    // Target and select statecode 1 option (at index 2)
    var scItem = controller.filterOptions.value[2] as FilterOptionItem;
    scItem.option.selected = true;

    // setup fake stateorprovince injection
    when(() => apiProvider.fetchAllStates()).thenAnswer((_) => Future.value(mockStates));

    await controller.fetchStatesOrProvinces();

    var spItem = controller.filterOptions.value[5] as FilterOptionItem;
    spItem.option.selected = true;
    controller.applyFilters();

    expect(controller.filterQs.value,
        'Microsoft.Dynamics.CRM.In(PropertyName=\'statecode\', PropertyValues=["1"]) and Microsoft.Dynamics.CRM.In(PropertyName=\'address1_stateorprovince\', PropertyValues=["${mockStates[1].value}"])');
  });
}
