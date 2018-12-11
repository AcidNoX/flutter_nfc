import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_nfc/flutter_nfc.dart';
import 'package:flutter_nfc/nfc_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NfcResult _nfcResult = null;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    NfcResult nfcResult;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      nfcResult = await FlutterNfc.readNfc;
    } on PlatformException {

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _nfcResult = nfcResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(children: <Widget>[
          Text('Data: ${_nfcResult?.data}'),
          Text('Scheme: ${_nfcResult?.scheme}'),
          Text('Language: ${_nfcResult?.language}'),

          RaisedButton(onPressed: this.initPlatformState, child: Text('Hello'),)
        ],),
      ),
    );
  }
}
