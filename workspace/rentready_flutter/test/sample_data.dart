import 'package:rentready_flutter/models/account.dart';
import 'package:rentready_flutter/models/filter_option.dart';

const mockAccountsResponse = {
  "value": [
    {
      "@odata.etag": "W/\"4350134\"",
      "name": "Fourth Coffee (sample)",
      "accountnumber": "ABSS4G45",
      "accountid": "018815b0-31ef-ec11-bb3d-002248816bae",
      "statecode": 0,
      "address1_stateorprovince": "TX",
      "address1_composite": "TX"
    }
  ]
};

const mockStatesResponse = {
  "value": [
    {"address1_stateorprovince": "TX", "address1_composite": "TX"},
    {"address1_stateorprovince": "WA", "address1_composite": "WA"},
    {"address1_stateorprovince": "TX", "address1_composite": "TX"}
  ]
};

final mockAccounts = [Account.fromJson(mockAccountsResponse['value']![0])];

final mockStates = [
  FilterOption('TX', type: FilterType.stateOrProvince),
  FilterOption('WA', type: FilterType.stateOrProvince)
];
