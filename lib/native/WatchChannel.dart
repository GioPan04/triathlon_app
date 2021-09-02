import 'package:flutter/services.dart';

class WatchChannel {
  static const _channel = const MethodChannel('it.gioelepannetto.triathlon_app/watch_channel');

  static Future<void> sendString(String data) async {
    String res = await _channel.invokeMethod('sendString', data);
    print(res);
  }
}