import 'package:flutter/material.dart';
import 'upload_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Animals'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Animal List
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Text("No animals uploaded yet."),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Upload Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadScreen()),
                );
              },
              child: Text('Upload Animal Info'),
            ),
          ],
        ),
      ),
    );
  }
}
