import 'package:flutter/material.dart';
import 'package:flutter_application_4/websocket/fake_web_socket.dart';

import '../../websocket/data/trade_packet.dart';

class OptionChainProvider extends ChangeNotifier {
  ApiResponseState expiryState = ApiResponseState.none;
  ApiResponseState optionChain = ApiResponseState.none;
  List optionChainList = [];

  Map<String, TradPacket> uninqueContractData = {};

  fetchExpiryForOption(String symbol) async {
    expiryState = ApiResponseState.loading;
    notifyListeners();
    // perform asyn task to fetch the option exp
    expiryState = ApiResponseState.success;
    notifyListeners();
    return [];
  }

  fetchOptionChainFromApi(expiry) async {
    optionChain = ApiResponseState.loading;
    // perform asyn task to fetch the option;
    optionChain = ApiResponseState.success;
    notifyListeners();
    optionChainList = [];
  }

  subscribeToBroadcast() {
    // subscribe to a streams to websocket channel;
    // uninqueContractData update this while subscribing
    // and updates its value
    _listenForSocketResponse();
    for (int i = 0; i < optionChainList.length; i++) {
      String putSeg = optionChainList[i].putSeg;
      String putSid = optionChainList[i].putSid;
      double putLtp = optionChainList[i].putLtp;
      String putKey = "$putSeg|$putSid";
      String callSeg = optionChainList[i].callSeg;
      String callSid = optionChainList[i].callSid;
      double callLtp = optionChainList[i].callLtp;
      String callKey = "$callSeg|$callSid";
      FakeWebSocket().send(putKey);
      FakeWebSocket().send(callKey);
      uninqueContractData[putKey] = TradPacket(putSid, putSeg, putLtp);
      uninqueContractData[putKey] = TradPacket(callSid, callSeg, callLtp);
    }
  }

  _listenForSocketResponse() {
    FakeWebSocket().onTradePacketRecived.listen((tradePacket) {
      String key = '${tradePacket.seg}|${tradePacket.sid}';
      uninqueContractData[key] = tradePacket;
      notifyListeners();
    });
  }
}

enum ApiResponseState {
  none,
  success,
  error,
  loading,
}
