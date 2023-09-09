import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80.0,
          ),
          Center(
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 100.0,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 250),
            child: Text(
              'Name',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(height: 50, color: Colors.black),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 250),
            child: Text(
              'About',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(height: 50, color: Colors.black),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 250),
            child: Text(
              'Phone',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(height: 50, color: Colors.black),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 250),
            child: Text(
              'Privacy',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
