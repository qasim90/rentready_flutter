import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:rr_qasim_assign/controllers/accounts_controller.dart';

class LayoutSwitcher extends StatelessWidget {
  LayoutSwitcher({Key? key}) : super(key: key);
  final controller = Get.find<AccountsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(right: 10),
      // height: 10,
      child: Obx(() => ToggleButtons(
            fillColor: Colors.amber,
            // borderColor: Colors.white,
            // selectedBorderColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            selectedColor: Colors.white,
            color: Colors.grey.shade600,
            children: const <Widget>[
              Icon(Icons.format_list_bulleted),
              Icon(Icons.grid_view),
            ],
            isSelected: controller.listGridStatus,
            onPressed: controller.onLayoutToggle,
          )),
    );
  }
}
