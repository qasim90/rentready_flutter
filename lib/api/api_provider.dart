import 'package:rr_qasim_assign/api/api_client.dart';
import 'package:rr_qasim_assign/constants.dart';
import 'package:rr_qasim_assign/models/account.dart';

class ApiProvider {
  Future<List<Account>> getAccounts(String searchQuery) async {
    var url = apiBaseUrl +
        'accounts?\$top=50&\$select=name,accountnumber,accountid,statecode,address1_stateorprovince,address1_composite,websiteurl,telephone1,emailaddress1';

    // Append the search query filter if its not empty (means user is searching)
    if (searchQuery.isNotEmpty) {
      url += "&\$filter=contains(name,'$searchQuery') or contains(accountnumber,'$searchQuery')";
    }

    try {
      var json = await Api().get_(url);
      List items = json['value'];
      return items.map((obj) => Account.fromJson(obj)).toList();
    } catch (e) {
      print('provider: $e');
      rethrow;
    }
  }
}
