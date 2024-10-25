import 'package:flutter/material.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:provider/provider.dart';

import 'widgets/expiry_list.dart';
import 'widgets/option_chain_header.dart';
import 'widgets/option_chain_list_view.dart';

class OptionChainScreen extends StatefulWidget {
  const OptionChainScreen({super.key});

  @override
  State<OptionChainScreen> createState() => _OptionChainScreenState();
}

class _OptionChainScreenState extends State<OptionChainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      OptionChainProvider provider = context.read<OptionChainProvider>();
      List expiry = await provider.fetchExpiryForOption("NIFTY");
      if (expiry.isNotEmpty) {
        await provider.fetchOptionChainFromApi(expiry[0]);
        provider.subscribeToBroadcast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          OptionChainHeader(),
          SizedBox(
            height: 8,
          ),
          ExpiryList(),
          SizedBox(
            height: 8,
          ),
          OptionChainListView(),
        ],
      ),
    );
  }
}
