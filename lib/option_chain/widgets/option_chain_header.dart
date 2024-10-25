import 'package:flutter/widgets.dart';

class OptionChainHeader extends StatelessWidget {
  const OptionChainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Call Option'),
        Text('Put Option'),
      ],
    );
  }
}
