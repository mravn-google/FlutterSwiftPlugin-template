import 'dart:async';

import 'package:flutter/services.dart';

class SwiftPluginPoc {
  static const MethodChannel _channel =
      const MethodChannel('swift_plugin_poc');

  static Future<String> get platformVersion =>
      _channel.invokeMethod('getPlatformVersion');
}
