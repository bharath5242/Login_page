import 'package:flutter/material.dart';

class VerificationCodePage extends StatelessWidget {
  final String emailOrPhone;

  VerificationCodePage(this.emailOrPhone);

  @override
  Widget build(BuildContext context) {
    // Mask the last 5 characters of emailOrPhone
    String maskedEmailOrPhone = emailOrPhone.replaceRange(emailOrPhone.length - 5, emailOrPhone.length, '*');

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
          "Enter Verification Code",
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
              "Enter code that we have sent to ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              maskedEmailOrPhone,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              // Add TextField for entering verification code
            ),
            SizedBox(height: 16),
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
                    "Submit",
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
