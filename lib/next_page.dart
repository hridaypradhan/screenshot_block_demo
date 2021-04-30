import 'package:flutter/material.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  ScreenshotCallback screenshotCallback = ScreenshotCallback();
  @override
  void initState() {
    screenshotCallback.addListener(() {
      print('Detected screenshot');
    });
    super.initState();
  }

  @override
  void dispose() {
    screenshotCallback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Next Page'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go to the previous page'),
            ),
            ElevatedButton(
              child: Text('Android forbidshot on'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
