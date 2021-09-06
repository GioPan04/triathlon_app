import 'package:flutter/services.dart';

class WatchChannel {
  
  final void Function(String error) callback;

  
  
  static const _channel = const MethodChannel('it.gioelepannetto.triathlon_app/watch_channel');

  WatchChannel(this.callback) {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case 'WatchKitError':
          this.callback(call.arguments as String);
          break;
        default:
          throw Exception();
      }

      return Future.value(null);
    });
  }

  static Future<void> sendString(String data) async {
    String res = await _channel.invokeMethod('sendString', data);
    print(res);
  }

}