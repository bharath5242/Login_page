import 'package:flutter/material.dart';
import 'package:login/signup.dart';
import 'package:login/forgotpassword.dart';
import 'package:login/newpassword.dart';

void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _login() {
    // Simulating login verification here
    // For example, you might use some authentication logic
    // and then display the success dialog if login is successful

    // For demonstration, let's assume the login is successful after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64,
                ),
                SizedBox(height: 16),
                Text(
                  "Yay! Welcome back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Once again you logged in successfully into medx app.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Implement navigation to the home screen here
                  },
                  child: Text('Go to Home'),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Implement back button functionality here
          },
        ),
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 20.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.green)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[700]),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                MaterialButton(
                  onPressed: _login,
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
                        "Login",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        // Implement Google sign-in functionality here
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                        ),
                        child: Image.asset(
                          'assets/google.png', // Path to your Google logo image
                          height: 50,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Implement Apple sign-in functionality here
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                        ),
                        child: Image.asset(
                          'assets/apple.png', // Path to your Apple logo image
                          height: 50,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Implement Facebook sign-in functionality here
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green),
                        ),
                        child: Image.asset(
                          'assets/facebook.png', // Path to your Facebook logo image
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
