import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _animalTypeController = TextEditingController();
  final _breedController = TextEditingController();
  final _localityController = TextEditingController();

  //Camera
  XFile? _imageFile;

  // Save the animal data to Firestore
  Future<void> saveAnimalData(String animalType, String breed, String locality) async {
    // Add the animal data to Firestore
   try {
      await FirebaseFirestore.instance.collection('animals').add({
        'animalType': _animalTypeController.text,
        'breed': _breedController.text,
        'locality': _localityController.text,
        'createdAt': Timestamp.now(),
      });
      print("Data uploaded successfully");
    } catch (error) {
      print("Error adding document: $error");
    }
  }
  // Handle the submit button
  Future<void> handleSubmit() async {
    await saveAnimalData(
      _animalTypeController.text,
      _breedController.text,
      _localityController.text
    );
  }

  // Open the camera to take a photo
  Future<void> _openCamera() async {
    final ImagePicker _picker = ImagePicker();

    // Open the camera and pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

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
            // Animal Photo section with icon for taking photo
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _openCamera,
              iconSize: 50,
            ),
            SizedBox(height: 20),

            // Display the taken photo
            if (_imageFile != null)
              Image.file(File(_imageFile!.path))
            else
              Text("No photo taken yet"),

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
              onPressed: () async { 
                await saveAnimalData(
                  _animalTypeController.text,
                  _breedController.text,
                  _localityController.text,
                );
                Navigator.pop(context);  // Go back to HomeScreen after the data is submitted
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
