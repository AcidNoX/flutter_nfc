import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'nfc_result.dart';

class FlutterNfc {
  static const MethodChannel _channel =
      const MethodChannel('flutter_nfc');

  static Future<NfcResult> get readNfc async {
    final String thing = await _channel.invokeMethod('readNfc');

    var jsonDecoded = json.decode(thing);

    return NfcResult.fromJson(jsonDecoded);
  }
}
