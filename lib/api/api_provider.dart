import 'package:rr_qasim_assign/api/api_client.dart';
import 'package:rr_qasim_assign/constants.dart';
import 'package:rr_qasim_assign/models/account.dart';

class ApiProvider {
  Future<List<Account>> getAccounts() async {
    const url = apiBaseUrl +
        'accounts?\$top=50&\$select=name,accountnumber,accountid,statecode,address1_stateorprovince,address1_composite,websiteurl,telephone1,emailaddress1';
    try {
      var json = await Api().get_(url);
      return json['values'].map((obj) => Account.fromJson(obj));
    } catch (e) {
      print('provider: $e');
      rethrow;
    }
  }
}
