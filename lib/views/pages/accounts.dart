import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentready_flutter/controllers/accounts_controller.dart';
import 'package:rentready_flutter/localizations/Translator.dart';
import 'package:rentready_flutter/views/widgets/account_grid_item.dart';
import 'package:rentready_flutter/views/widgets/account_list_item.dart';
import 'package:rentready_flutter/views/widgets/filters_popup.dart';
import 'package:rentready_flutter/views/widgets/layout_switcher.dart';
import 'package:rentready_flutter/views/widgets/preloader.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({Key? key}) : super(key: key);

  // GetX controller to hold the state and logic for this view
  final controller = Get.put(AccountsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Translator().getText('accounts')), actions: [LayoutSwitcher()]),
      body: Stack(
        children: [
          Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                      onSubmitted: controller.onSearch,
                      textCapitalization: TextCapitalization.words,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          // border: InputBorder.none,
                          hintText: Translator().getText('search'))),
                ),
                TextButton.icon(
                    onPressed: () => FiltersPopup.present(context),
                    icon: const Icon(Icons.filter_alt),
                    label: Text(Translator().getText('filter')))
              ],
            ),
            Expanded(
                child: Obx(() => controller.isListView
                    ? ListView.separated(
                        itemCount: controller.accounts.length,
                        padding: const EdgeInsets.only(top: 10),
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return AccountListItem(controller.accounts[index]);
                        })
                    : GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        children: controller.accounts.map((acct) => AccountGridItem(acct)).toList())))
          ]),
          Obx(() => controller.isLoading ? const Preloader() : const SizedBox.shrink())
        ],
      ),
    );
  }
}
