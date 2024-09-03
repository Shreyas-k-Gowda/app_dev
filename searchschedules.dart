import 'package:flutter/material.dart';

class SearchSchedules extends StatelessWidget {
  const SearchSchedules({super.key});

  get date => null;

  get time => null;

  get genderConstraint => null;

  get fromLocation => null;

  get toLocation => null;
  get phoneNumber => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Rides'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Text('Ride Details'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Date: $date'),
                    Text('Time: $time'),
                    Text('Gender Constraint: $genderConstraint'),
                    Text('From: $fromLocation'),
                    Text('To: $toLocation'),
                    Text('Phone: $phoneNumber'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
