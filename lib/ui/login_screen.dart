// login_screen.dart

import 'package:flutter/material.dart';
import 'package:health_app/main.dart';

class LoginScreen extends StatelessWidget {
void authenticateUser() {
  print('Custom function called!');
  // Add your logic here
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () {
          //       // Implement login functionality here
          //       String username = usernameController.text;
          //       String password = passwordController.text;

          // if (authenticateUser(username, password)) {
            // Navigate to the home page or perform the desired action
            Navigator.pushReplacementNamed(context, Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
                
          },
          child: Text('Login'),
          // else {
          //   // Display an error message or handle failed login
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('Invalid username or password')),
          //   );
          // }

              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Implement forgot password functionality here
              },
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
