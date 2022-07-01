import 'package:flutter_test/flutter_test.dart';
import 'package:get/instance_manager.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rentready_flutter/api/api_client.dart';
import 'package:rentready_flutter/api/api_provider.dart';
import 'package:rentready_flutter/models/account.dart';
import 'package:rentready_flutter/models/filter_option.dart';

import 'sample_data.dart';

class MockApiClient extends Mock implements Api {}

void main() {
  late ApiProvider apiProvider;
  late MockApiClient apiClient;

  setUpAll(() {
    Get.put<Api>(MockApiClient());
  });

  setUp(() {
    apiClient = Get.find<Api>() as MockApiClient;
    apiProvider = ApiProvider();
  });

  test("Create accoounts from json", () async {
    when(() => apiClient.get_(any())).thenAnswer((_) => Future.value(mockAccountsResponse));

    expect(await apiProvider.getAccounts('', ''), isA<List<Account>>());
  });

  test("Create accoounts has error", () {
    when(() => apiClient.get_(any())).thenThrow(Exception('Unauthorized'));

    expect(() async => await apiProvider.getAccounts('', ''), throwsException);
  });

  test("Create stateOrProvince filteroptions from json", () async {
    when(() => apiClient.get_(any())).thenAnswer((_) => Future.value(mockStatesResponse));

    expect(await apiProvider.fetchAllStates(), isA<List<FilterOption>>());
  });

  test("Verify stateOrProvince are unique and has no duplicates", () async {
    when(() => apiClient.get_(any())).thenAnswer((_) => Future.value(mockStatesResponse));
    var opts = await apiProvider.fetchAllStates();
    expect(opts.length, lessThan(mockStatesResponse['value']!.length));
  });
}
