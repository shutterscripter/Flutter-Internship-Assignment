import 'package:flutter/material.dart';

class Page04 extends StatelessWidget {
  const Page04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "This app is as an assignment for flutter internship at 'Quantmhill IT Solutions And Consulting Private Limited'.\n\n- Submitted by Jayesh Shinde",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
