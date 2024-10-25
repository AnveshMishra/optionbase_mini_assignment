import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:provider/provider.dart';

import '../../websocket/data/trade_packet.dart';

class Contract extends StatelessWidget {
  final String contractKey;
  const Contract({super.key, required this.contractKey});

  @override
  Widget build(BuildContext context) {
    // write logic to create unique key from index;
    return Selector<OptionChainProvider, TradPacket?>(
      builder: (context, value, __) {
        // handle value update widgets
        return Container();
      },
      selector: (p0, p1) => p1.uninqueContractData[contractKey],
    );
  }
}
