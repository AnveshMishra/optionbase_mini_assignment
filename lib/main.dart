import 'package:flutter/material.dart';
import 'package:flutter_application_4/option_chain/state_management/option_chain_proivder.dart';
import 'package:flutter_application_4/websocket/fake_web_socket.dart';
import 'package:provider/provider.dart';

import 'option_chain/option_chain_screen.dart';

void main() {
  FakeWebSocket().connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (BuildContext context) => OptionChainProvider(),
          child: const OptionChainScreen()),
    );
  }
}
