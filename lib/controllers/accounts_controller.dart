import 'package:get/get.dart';

class AccountsController extends GetxController {
  // Oberveable list to hold state for list/grid toggle buttons
  final _listGridStatus = [true, false].obs;

  List<bool> get listGridStatus => _listGridStatus.value;
  bool get isListView => listGridStatus[0] == true;

  onLayoutToggle(int activeIndex) {
    // index 0 = ListView layout, index 1 = GridView layout
    _listGridStatus.value = (activeIndex == 0) ? [true, false] : [false, true];
  }
}
