import 'package:flutter/material.dart';
import 'package:rentready_flutter/models/account.dart';

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account = ModalRoute.of(context)!.settings.arguments as Account;

    return Scaffold(
      appBar: AppBar(title: Text(account.name)),
      body: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: double.infinity),
        child: SingleChildScrollView(
          child: Wrap(
              spacing: 20,
              direction: Axis.vertical,
              // alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(width: 300, height: 200, margin: const EdgeInsets.only(top: 20), color: Colors.grey),
                Text(account.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  account.address,
                  textAlign: TextAlign.center,
                ),
                Text(account.website, style: const TextStyle(color: Colors.blue)),
                Text(account.email, style: const TextStyle(color: Colors.blue)),
                Text(account.phone)
              ]),
        ),
      ),
    );
  }
}
