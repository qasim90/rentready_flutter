import 'package:rentready_flutter/api/api_client.dart';
import 'package:rentready_flutter/constants.dart';
import 'package:rentready_flutter/models/account.dart';
import 'package:rentready_flutter/models/filter_option.dart';

class ApiProvider {
  Future<List<Account>> getAccounts(String searchQuery, String filters) async {
    var url = apiBaseUrl +
        'accounts?\$top=50&\$select=name,accountnumber,accountid,statecode,address1_stateorprovince,address1_composite,websiteurl,telephone1,emailaddress1';

    // Append the search query filter if its not empty (means user is searching)
    if (searchQuery.isNotEmpty) {
      url += "&\$filter=contains(name,'$searchQuery') or contains(accountnumber,'$searchQuery')";
    }

    // Append filters query string part if available
    if (filters.isNotEmpty) {
      url += (searchQuery.isEmpty) ? '&\$filter=' : ' and ';

      url += filters;
    }

    try {
      var json = await Api().get_(url);
      List items = json['value'];
      return items.map((obj) => Account.fromJson(obj)).toList();
    } catch (e) {
      print('$e');
      rethrow;
    }
  }

  Future<List<FilterOption>> fetchAllStates() async {
    var url = apiBaseUrl + 'accounts?\$select=address1_stateorprovince&\$filter=address1_stateorprovince ne null';

    try {
      var json = await Api().get_(url);
      List items = json['value'];
      return items.map((obj) => obj['address1_stateorprovince']).toSet().map(((e) => FilterOption(e))).toList();
    } catch (e) {
      print('$e');
      rethrow;
    }
  }
}
