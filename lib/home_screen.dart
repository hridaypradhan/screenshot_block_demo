import 'package:flutter/material.dart';
import 'package:screenshot_block_demo/next_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Screen'),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(),
                  ),
                );
              },
              child: Text('Go to the next page'),
            ),
          ],
        ),
      ),
    );
  }
}
