import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:flutter_application_4/option_chain/widgets/contract.dart';
import 'package:provider/provider.dart';

class CallPutRow extends StatelessWidget {
  final int index;
  const CallPutRow({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var optionChainList = context.read<OptionChainProvider>().optionChainList;
    String putSeg = optionChainList[index].putSeg;
    String putSid = optionChainList[index].putSid;
    String putKey = "$putSeg|$putSid";
    String callSeg = optionChainList[index].callSeg;
    String callSid = optionChainList[index].callSid;
    String callKey = "$callSeg|$callSid";
    return Row(
      children: [
        Expanded(
            child: Contract(
          contractKey: callKey,
        )),
        Expanded(
          child: Contract(
            contractKey: putKey,
          ),
        ),
      ],
    );
  }
}
