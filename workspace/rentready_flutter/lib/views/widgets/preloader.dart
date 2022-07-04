import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Preloader extends StatelessWidget {
  const Preloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 55,
      height: 55,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
      ),
    ));
  }
}
