import 'package:flutter/services.dart';

class PlatformChannels {
  static const MethodChannel _channel = MethodChannel('com.example.calculator/channel');

  static Future<void> startListening() async {
    await _channel.invokeMethod('startListening');
  }

  static Future<void> stopListening() async {
    await _channel.invokeMethod('stopListening');
  }
}
