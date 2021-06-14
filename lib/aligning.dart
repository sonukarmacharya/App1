import 'package:flutter/material.dart';

class Aligning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alligning page')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('This is first text'),
              Text(
                'This is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second textThis is second text',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green[500]),
                      Icon(Icons.star, color: Colors.green[500]),
                      Icon(Icons.star, color: Colors.green[500]),
                      Icon(Icons.star, color: Colors.black),
                      Icon(Icons.star, color: Colors.black),
                    ],
                  ),
                  Text("170 Reviews")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.perm_phone_msg),
                      Text("Phone"),
                      Text("********"),
                    ],
                  ),
                  Column(children: [
                    Icon(Icons.perm_phone_msg),
                    Text("Phone"),
                    Text("********"),
                  ])
                ],
              ),
              Stack(
                alignment: const Alignment(0.34, 0.6),
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 100,
                  ),
                  Container(
                      child: Text(
                    'Mia B',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                ],
              )
            ]),
      ),
    );
  }
}
