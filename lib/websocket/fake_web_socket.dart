import 'dart:async';
import 'dart:developer';

import 'package:flutter_application_4/websocket/data/trade_packet.dart';

class FakeWebSocket {
  FakeWebSocket._internal();
  static final FakeWebSocket _instance = FakeWebSocket._internal();
  factory FakeWebSocket() => _instance;

  final StreamController<TradPacket> _tradePacketController = StreamController<TradPacket>();
  final StreamController<String> _inputController = StreamController<String>();
  bool _isConnected = false;

  Stream<TradPacket> get onTradePacketRecived => _tradePacketController.stream;

  void connect() {
    _isConnected = true;
    log('Fake WebSocket connected.');

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_isConnected) {
        timer.cancel();
      } else {
        _tradePacketController.add(TradPacket('1135', '1', 1.0 + timer.tick));
      }
    });

    _inputController.stream.listen((data) {
      log('Client sent: $data');
    });
  }

  void send(String key) {
    if (_isConnected) {
      log('subscribing: $key');
      _inputController.add(key);
    } else {
      log('Cannot send, WebSocket not connected.');
    }
  }

  void close() {
    _isConnected = false;
    _tradePacketController.close();
    _inputController.close();
    log('Fake WebSocket closed.');
  }
}

