import 'package:flutter/material.dart';
import 'package:rr_qasim_assign/models/account.dart';

class AccountGridItem extends StatelessWidget {
  AccountGridItem(this.account, {Key? key}) : super(key: key);
  Account account;

  @override
  build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail'),
        child: Wrap(
            spacing: 5,
            direction: Axis.vertical,
            // alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(width: 100, height: 100, color: Colors.grey),
              Text(account.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(account.address),
              Text(account.website, style: const TextStyle(color: Colors.blue)),
              Text(account.email, style: const TextStyle(color: Colors.blue)),
              Text(account.phone)
            ]),
      ),
    );
  }
}
