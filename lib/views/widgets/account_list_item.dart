import 'package:flutter/material.dart';

class AccountListItem extends StatelessWidget {
  const AccountListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(width: 130, height: 100, color: Colors.grey.shade400),
          const SizedBox(width: 10),
          Wrap(
            spacing: 5,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              Text('Fourth Coffee (sample)', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('5009 Orange Street Renton, TX 20175 U.S.'),
              Text('http://www.fourthcoffee.com/', style: TextStyle(color: Colors.blue)),
              Text('someone1@example.com', style: TextStyle(color: Colors.blue)),
              Text('555-0150')
            ],
          )
        ],
      ),
    );
  }
}
