import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:provider/provider.dart';

import 'call_put_row.dart';

class OptionChainListView extends StatelessWidget {
  const OptionChainListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Selector<OptionChainProvider, ApiResponseState>(
            builder: (_, value, __) {
              switch (value) {
                case ApiResponseState.none:
                case ApiResponseState.error:
                case ApiResponseState.loading:
                // show loader

                case ApiResponseState.success:
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return CallPutRow(index: index,);
                    },
                    itemCount: context
                        .read<OptionChainProvider>()
                        .optionChainList
                        .length,
                  );
              }
              return const SizedBox.shrink();
            },
            selector: (_, p) => p.optionChain));
  }
}
