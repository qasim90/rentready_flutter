import 'package:flutter/material.dart';
import 'package:rr_qasim_assign/localizations/Translator.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translator().getText('accounts')),
      ),
    );
  }
}
