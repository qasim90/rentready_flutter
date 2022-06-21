import 'package:flutter/material.dart';
import 'package:rr_qasim_assign/models/account.dart';

class AccountListItem extends StatelessWidget {
  AccountListItem(this.account, {Key? key}) : super(key: key);
  Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail'),
        child: Row(
          children: [
            Container(width: 130, height: 100, color: Colors.grey.shade400),
            const SizedBox(width: 10),
            Wrap(
              spacing: 5,
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text(account.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(account.address),
                Text(account.website, style: const TextStyle(color: Colors.blue)),
                Text(account.email, style: const TextStyle(color: Colors.blue)),
                Text(account.phone)
              ],
            )
          ],
        ),
      ),
    );
  }
}
