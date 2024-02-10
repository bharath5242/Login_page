import 'package:flutter/material.dart';
import 'package:login/newpassword.dart'; // Add the missing import statement

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

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
          "Verification Code",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Enter the code that we have sent to your",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPTextField(_focusNode1, _focusNode2),
                _buildOTPTextField(_focusNode2, _focusNode3),
                _buildOTPTextField(_focusNode3, _focusNode4),
                _buildOTPTextField(_focusNode4, FocusNode()), // Create a dummy FocusNode for the last box

              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your verification logic here
                // Navigate to NewPasswordPage after verification
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPasswordPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text(
                "Verify",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the code? ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add logic to resend code
                },
                child: Text(
                  "Resend",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOTPTextField(FocusNode focusNode, FocusNode nextFocusNode) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counter: Offstage(),
          hintText: "*",
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            focusNode.unfocus();
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        focusNode: focusNode,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VerificationPage(),
  ));
}
