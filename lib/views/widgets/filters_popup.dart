import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rr_qasim_assign/controllers/accounts_controller.dart';
import 'package:rr_qasim_assign/localizations/Translator.dart';
import 'package:rr_qasim_assign/models/filter_option.dart';

class FiltersPopup extends StatelessWidget {
  FiltersPopup({Key? key}) : super(key: key);

  static present(ctx) => showModalBottomSheet(
        context: ctx,
        isScrollControlled: true,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(ctx).size.height * .80),
        builder: (cntxt) => FiltersPopup(),
      );

  final controller = Get.find<AccountsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(Translator().getText('filter')),
          actions: [
            TextButton(
                style: TextButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  controller.applyFilters();
                  Navigator.pop(context);
                },
                child: Text(Translator().getText('apply')))
          ],
        ),
        Flexible(
          child: Obx(() => ListView.builder(
              itemCount: controller.filterOptions.length,
              itemBuilder: (ctx, index) {
                var item = controller.filterOptions.value[index];
                return item.build(controller.filterOptions.refresh);
              })),
        ),
      ],
    );
  }
}

abstract class ListItem {
  Widget build(Function? cb);
}

class HeadingItem implements ListItem {
  String title;

  HeadingItem(this.title);

  @override
  Widget build(Function? cb) {
    return ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        tileColor: Colors.grey.shade200);
  }
}

class FilterOptionItem implements ListItem {
  FilterOption option;

  FilterOptionItem(this.option);

  @override
  Widget build(Function? cb) {
    return CheckboxListTile(
        title: Text(option.value),
        value: option.selected,
        onChanged: (newValue) {
          option.selected = newValue!;
          if (cb != null) cb();
        },
        controlAffinity: ListTileControlAffinity.leading);
  }
}
