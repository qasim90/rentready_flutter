import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_qasim_assign/controllers/accounts_controller.dart';
import 'package:rr_qasim_assign/localizations/Translator.dart';
import 'package:rr_qasim_assign/views/widgets/account_grid_item.dart';
import 'package:rr_qasim_assign/views/widgets/account_list_item.dart';
import 'package:rr_qasim_assign/views/widgets/layout_switcher.dart';

class AccountsPage extends StatelessWidget {
  AccountsPage({Key? key}) : super(key: key);

  // GetX controller to hold the state and logic for this view
  final controller = Get.put(AccountsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Translator().getText('accounts')), actions: [LayoutSwitcher()]),
      body: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                  onChanged: (value) => {},
                  textCapitalization: TextCapitalization.words,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      // border: InputBorder.none,
                      hintText: Translator().getText('search'))),
            ),
            TextButton.icon(
                onPressed: () => {}, icon: const Icon(Icons.filter_alt), label: Text(Translator().getText('filter')))
          ],
        ),
        Expanded(
            child: Obx(() => controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.isListView
                    ? ListView.separated(
                        itemCount: controller.accounts.length,
                        padding: const EdgeInsets.only(top: 10),
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return AccountListItem(controller.accounts[index]);
                        })
                    : GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                        children: controller.accounts.map((acct) => AccountGridItem(acct)).toList())))
      ]),
    );
  }
}
