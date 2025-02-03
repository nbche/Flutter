import 'package:flutter/material.dart';
import 'package:flutter_lab/Service Design/todolist.dart';
import 'package:flutter_lab/Service Design/home.dart';

void main() {
  runApp(const MyApp()); //
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _companyCodeController = TextEditingController();
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _companyCodeController.dispose();
    _userCodeController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _login() {
    String companyCode = _companyCodeController.text;
    String userCode = _userCodeController.text;
    String otp = _otpController.text;

    print('Company Code: $companyCode');
    print('User Code: $userCode');
    print('OTP: $otp');

    Future.delayed(const Duration(seconds: 2), () { // Simulate a 2-second delay
      bool isAuthenticated = companyCode == "test" && userCode == "test" && otp == "1234"; // Example check

      if (isAuthenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ToDoListPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 1,
        title: const Text(
          'Your European Finance Team',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton( // Add a leading IconButton
          icon: const Icon(Icons.calculate_outlined, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 300, // Reduced size for better fit
                height: 300, // Reduced size for better fit
                child: Image.asset(
                  'images/ServiceDesign/CoffeeMug.jpg', // Make sure the path is correct
                  fit: BoxFit.contain, // Use BoxFit.contain to avoid cropping
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _companyCodeController,
                decoration: const InputDecoration(
                  labelText: 'Company Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _userCodeController,
                decoration: const InputDecoration(
                  labelText: 'User Code',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'One-Time Password (OTP)',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ToDoListPage()),
                  );
                }, // Call the _login function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}