import 'package:flutter/material.dart';
import 'package:fundraiser_app/login.dart';
import 'package:get/get.dart';

class InnovatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Innovator"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add your logout logic here
              Get.offAll(Login()); // Example: Navigate to Login screen
            },
          ),
        ],
      ),
      body: Center(
        child: Text("I am Innovator"),
      ),
    );
  }
}
