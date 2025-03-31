import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _animalTypeController = TextEditingController();
  final _breedController = TextEditingController();
  final _localityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Animal Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Pet Photo
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Animal Photo')),
            ),
            SizedBox(height: 20),

            // Animal Type TextField
            TextFormField(
              controller: _animalTypeController,
              decoration: InputDecoration(
                labelText: 'Animal Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Breed TextField
            TextFormField(
              controller: _breedController,
              decoration: InputDecoration(
                labelText: 'Breed',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Locality Spotted TextField
            TextFormField(
              controller: _localityController,
              decoration: InputDecoration(
                labelText: 'Locality Spotted',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Submit Button 
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
