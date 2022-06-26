import 'package:get/get.dart';
import 'package:rentready_flutter/api/api_provider.dart';
import 'package:rentready_flutter/localizations/Translator.dart';
import 'package:rentready_flutter/models/filter_option.dart';
import 'package:rentready_flutter/views/widgets/filters_popup.dart';

class AccountsController extends GetxController {
  // Oberveable list to hold state for list/grid toggle buttons
  final _listGridStatus = [true, false].obs;
  final accounts = [].obs;
  final _isLoading = false.obs;

  // Filters
  var searchStr = ''.obs;
  var filterQs = ''.obs;

  // StateCode has only two possible options so we can hardcode them
  final filterOptions = <dynamic>[
    HeadingItem(Translator().getText('byStateCode')),
    FilterOptionItem(FilterOption('0', type: FilterType.sateCode)),
    FilterOptionItem(FilterOption('1', type: FilterType.sateCode))
  ].obs;

  List<bool> get listGridStatus => _listGridStatus.value;
  bool get isListView => listGridStatus[0] == true;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    super.onInit();
    await fetchAccounts();
    await fetchStatesOrProvinces();

    // Listen to search input and filter option changes. Fetch accounts every time
    // a change happen in these two Rx variables.
    ever(searchStr, (newValue) => fetchAccounts(query: searchStr.value, filters: filterQs.value));
    ever(filterQs, (newValue) => fetchAccounts(query: searchStr.value, filters: filterQs.value));
  }

  onLayoutToggle(int activeIndex) {
    // index 0 = ListView layout, index 1 = GridView layout
    _listGridStatus.value = (activeIndex == 0) ? [true, false] : [false, true];
  }

  fetchAccounts({String query = '', String filters = ''}) async {
    _isLoading.value = true;
    try {
      final _accounts = await ApiProvider().getAccounts(query, filters);
      accounts.assignAll(_accounts);
      _isLoading.value = false;
    } on Exception catch (e) {
      printError(info: e.toString());
    }
  }

  fetchStatesOrProvinces() async {
    try {
      final _stateOpts = await ApiProvider().fetchAllStates();
      if (_stateOpts.isNotEmpty) {
        // Append heading item for state or province section
        filterOptions.add(HeadingItem(Translator().getText('byStateProvince')));

        // Map filter options to FilterOptionItem which is wrapper class including both
        // data and view configuration.
        var items = _stateOpts.map((e) => FilterOptionItem(e));
        filterOptions.addAll(items);
      }
      // _isLoading.value = false;
    } on Exception catch (e) {
      printError(info: e.toString());
    }
  }

  onSearch(value) => searchStr.value = value;

  applyFilters() {
    String filterStr = '';
    List stateCodeValues = [];
    List stateProvinceValues = [];

    // Filter out selected filter options and push to relevent List
    for (var item in filterOptions) {
      if (item is FilterOptionItem && item.option.selected) {
        item.option.type == FilterType.sateCode
            ? stateCodeValues.add(item.option.value)
            : stateProvinceValues.add(item.option.value);
      }
    }

    // Construct statecode filter portion
    if (stateCodeValues.isNotEmpty) {
      filterStr =
          'Microsoft.Dynamics.CRM.In(PropertyName=\'statecode\', PropertyValues=[${getQuotedStrings(stateCodeValues)}])';
    }

    // Construct stateOrProvince filter portion
    if (stateProvinceValues.isNotEmpty) {
      // append 'and' operation if statecode part is also present
      if (filterStr.isNotEmpty) filterStr += ' and ';
      filterStr =
          'Microsoft.Dynamics.CRM.In(PropertyName=\'address1_stateorprovince\', PropertyValues=[${getQuotedStrings(stateProvinceValues)}])';
    }

    // Finally update the observable filter query string to trigger accoounts fetching.
    if (filterStr.isNotEmpty) {
      filterQs.value = filterStr;
    }
  }

  getQuotedStrings(List list) => '"${list.join('","')}"';
}
