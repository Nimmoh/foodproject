import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_app/details_page.dart';
import 'package:health_app/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthy Food App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Replace the URL with your actual login API endpoint
    final String apiUrl = 'https://login-signup.p.rapidapi.com/394e9338b73a9f061b1968ceaa050a/login';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        // Parse the response data (assuming it's a JSON with a token field)
        final Map<String, dynamic> data = json.decode(response.body);
        final String token = data['token'];

        // Navigate to the home page if authentication is successful
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(token: token)),
        );
      } else {
        // Handle authentication failure (show an error message, etc.)
        print('Authentication failed: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Error during login: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add your authentication logic here
                // For simplicity, let's just navigate to the home page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage(
                    token: 'Token: $e0000cc068e0a1a760c8e94039bc9b9a8a033a759d018d6ff6f540eabe25f51ed1f30712c14cf4dfba50eb53cd86b363dd0e2b6a04abd6d8e8ce6e6d39875be6',),
                  ),
                );
              },
              child:  const Text('open homepage'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String token;

  MyHomePage({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Token: $token'),
      ),
    );
  }
}
