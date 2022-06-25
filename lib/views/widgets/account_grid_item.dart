import 'package:flutter/material.dart';
import 'package:rr_qasim_assign/models/account.dart';

class AccountGridItem extends StatelessWidget {
  AccountGridItem(this.account, {Key? key}) : super(key: key);
  Account account;

  @override
  build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail', arguments: account),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(width: 100, height: 100, margin: const EdgeInsets.symmetric(vertical: 10), color: Colors.grey),
          Text(account.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(account.address, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
          const SizedBox(height: 5),
          // Text(account.website, textAlign: TextAlign.center, style: const TextStyle(color: Colors.blue)),
          // const SizedBox(height: 5),
          // Text(account.email, textAlign: TextAlign.center, style: const TextStyle(color: Colors.blue)),
          // const SizedBox(height: 5),
          Text(account.phone)
        ]),
      ),
    );
  }
}
