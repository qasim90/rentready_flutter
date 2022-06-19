import 'package:flutter/material.dart';

class AccountGridItem extends StatelessWidget {
  const AccountGridItem({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Card(
      child: Wrap(
          spacing: 5,
          direction: Axis.vertical,
          // alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(width: 100, height: 100, color: Colors.grey),
            const Text('Fourth Coffee (sample)', style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('5009 Orange Street Renton, TX 20175 U.S.'),
            const Text('http://www.fourthcoffee.com/', style: TextStyle(color: Colors.blue)),
            const Text('someone1@example.com', style: TextStyle(color: Colors.blue)),
            const Text('555-0150')
          ]),
    );
  }
}
