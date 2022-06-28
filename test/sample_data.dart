import 'package:rentready_flutter/models/account.dart';
import 'package:rentready_flutter/models/filter_option.dart';

final mockAccounts = [
  Account.fromJson({
    "@odata.etag": "W/\"4350134\"",
    "name": "Fourth Coffee (sample)",
    "accountnumber": "ABSS4G45",
    "accountid": "018815b0-31ef-ec11-bb3d-002248816bae",
    "statecode": 0,
    "address1_stateorprovince": "TX",
    "address1_composite": "TX"
  })
];

final mockStates = [
  FilterOption('TX', type: FilterType.stateOrProvince),
  FilterOption('WA', type: FilterType.stateOrProvince)
];
