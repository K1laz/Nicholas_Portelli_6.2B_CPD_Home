import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'upload_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploaded Animals'),
      ),
      body: Column(
        children: [
          // StreamBuilder to display the list of animals
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('animals')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var animals = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: animals.length,
                  itemBuilder: (context, index) {
                    var animal = animals[index];
                    DateTime date = (animal['createdAt'] as Timestamp).toDate();
                    String formattedDate = DateFormat('d MMMM yyyy | kk:mm').format(date);

                    return ListTile(
                      title: Text(animal['animalType']),
                      subtitle: Text('Breed: ${animal['breed']} | Locality: ${animal['locality']} | Date: $formattedDate'),
                  );
                  },
                );
              },
            ),
          ),
          
          ElevatedButton(
            onPressed: () {
              // Navigate to the UploadScreen when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UploadScreen()),
              );
            },
            child: Text('Upload Animal Info'),  
          ),
        ],
      ),
    );
  }
}
