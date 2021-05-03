import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_forbidshot/flutter_forbidshot.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  // Lines 12 to 31 and line 35 needed only for iOS
  bool isCaptured = false;
  StreamSubscription<void> subscription;
  init() async {
    bool isCapture = await FlutterForbidshot.iosIsCaptured;
    setState(() {
      isCaptured = isCapture;
    });
    subscription = FlutterForbidshot.iosShotChange.listen((event) {
      setState(() {
        isCaptured = !isCaptured;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  @override
  void initState() {
    init();
    FlutterForbidshot.setAndroidForbidOn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FlutterForbidshot.setAndroidForbidOff();
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Next Page'),
              ElevatedButton(
                onPressed: () {
                  FlutterForbidshot.setAndroidForbidOff();
                  Navigator.pop(context);
                },
                child: Text('Go to the previous page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
