import 'package:flutter/material.dart';

class AccountDetailPage extends StatelessWidget {
  const AccountDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                Container(width: 300, height: 200, color: Colors.grey),
                const Text('Fourth Coffee (sample)', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('5009 Orange Street Renton, TX 20175 U.S.'),
                const Text('http://www.fourthcoffee.com/', style: TextStyle(color: Colors.blue)),
                const Text('someone1@example.com', style: TextStyle(color: Colors.blue)),
                const Text('555-0150')
              ]),
        ),
      ),
    );
  }
}
