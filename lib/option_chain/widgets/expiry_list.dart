import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:provider/provider.dart';

class ExpiryList extends StatelessWidget {
  const ExpiryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<OptionChainProvider, ApiResponseState>(
        builder: (_, value, __) {
          switch (value) {
            case ApiResponseState.none:
            case ApiResponseState.loading:
            // return loader
            case ApiResponseState.success:
            // return Epxiry list widget
            case ApiResponseState.error:
            // return some error widget
          }
          return const SizedBox();
        },
        selector: (_, provider) => provider.expiryState);
  }
}
