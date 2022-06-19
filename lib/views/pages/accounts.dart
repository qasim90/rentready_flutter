import 'package:flutter/material.dart';
import 'package:rr_qasim_assign/localizations/Translator.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Translator().getText('accounts')), actions: [
        Container(
          // alignment: Alignment.centerRight,
          margin: const EdgeInsets.symmetric(vertical: 7),
          padding: const EdgeInsets.only(right: 10),
          // height: 10,
          child: ToggleButtons(
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
            isSelected: const [true, false],
            onPressed: onLayoutToggle,
          ),
        )
      ]),
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
        )
      ]),
    );
  }

  onLayoutToggle(int index) {}
}
