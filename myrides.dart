import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class Myrides extends StatefulWidget {
  final phoneNumber;
  const Myrides({super.key, required this.phoneNumber});

  @override
  State<Myrides> createState() => _ScheduledRidesScreenState();
}

class _ScheduledRidesScreenState extends State<Myrides> {
  String pno = '';
  List<Map<String, dynamic>> _rides = [];

  // Fetch rides on initState
  @override
  void initState() {
    pno = widget.phoneNumber;
    super.initState();
    _fetchRides();
  }

  // Function to fetch rides from Firestore
  Future<void> _fetchRides() async {
    // Get rides based on your logic (e.g., from user's document)
    CollectionReference ridesRef = FirebaseFirestore.instance
        .collection('users')
        .doc(pno)
        .collection('rides');

    QuerySnapshot querySnapshot = await ridesRef.get();

    setState(() {
      _rides = querySnapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Scheduled Rides'),
      ),
      body: _rides.isEmpty
          ? const Center(child: Text('No scheduled rides found.'))
          : ListView.builder(
              itemCount: _rides.length,
              itemBuilder: (context, index) {
                final ride = _rides[index];
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    title: Text(ride['source'] + ' to ' + ride['destination']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date: ${ride['date']}'),
                        Text('Time: ${ride['time']}'),
                        Text('Passenger Count: ${ride['count']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
