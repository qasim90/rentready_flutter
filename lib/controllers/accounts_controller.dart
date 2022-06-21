import 'package:get/get.dart';
import 'package:rr_qasim_assign/api/api_provider.dart';

class AccountsController extends GetxController {
  // Oberveable list to hold state for list/grid toggle buttons
  final _listGridStatus = [true, false].obs;
  final accounts = [].obs;
  final _isLoading = false.obs;

  List<bool> get listGridStatus => _listGridStatus.value;
  bool get isListView => listGridStatus[0] == true;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    fetchAccounts();
    super.onInit();
  }

  onLayoutToggle(int activeIndex) {
    // index 0 = ListView layout, index 1 = GridView layout
    _listGridStatus.value = (activeIndex == 0) ? [true, false] : [false, true];
  }

  fetchAccounts() async {
    _isLoading.value = true;
    try {
      final _accounts = await ApiProvider().getAccounts();
      accounts.assignAll(_accounts);
      _isLoading.value = false;
    } on Exception catch (e) {
      printError(info: e.toString());
    }
  }
}
