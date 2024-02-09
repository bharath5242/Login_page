import 'package:flutter/material.dart';
import 'package:login/verification.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Forgot Your Password?",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your email or phone number, we will send you cofirmation code",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEmailSelected = true;
                      });
                    },
                    child: Text("Email"),
                    style: ElevatedButton.styleFrom(
                      primary: isEmailSelected ? Colors.white : Colors.grey[300], // Adjusted colors
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16), // Adjusted padding
                    ),
                  ),
                ),
                SizedBox(width: 16), // Added spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEmailSelected = false;
                      });
                    },
                    child: Text("Phone"),
                    style: ElevatedButton.styleFrom(
                      primary: !isEmailSelected ? Colors.white : Colors.grey[300], // Adjusted colors
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16), // Adjusted padding
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            isEmailSelected
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                SizedBox(height: 16),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your mobile number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            MaterialButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.green,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Reset your password",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
