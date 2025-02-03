import 'package:flutter/material.dart';
import 'package:flutter_lab/Service Design/login.dart';
import 'package:flutter_lab/Service Design/contact.dart';

void main() {
  runApp(const MyApp());
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      ),
      body:Center( // Center the *entire* scroll view
        child: SingleChildScrollView( // Scrollable content is *inside* the Center
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 24),
              Image.asset(
                'images/ServiceDesign/DottedEurope.jpg',
                height: 300, // Set a fixed height, or use BoxFit as needed
                fit: BoxFit.cover, // or BoxFit.contain, depending on your needs
              ),
              const SizedBox(height: 32),
              Text(
                'AI based Finance Foundation',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 16),
              Text(
                "We are dedicated to providing top-tier financial services across Europe with the AI based solutions.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,// Center the text
              ),
              const SizedBox(height: 8),
              Text(
                "Please check your today's operation.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,// Center the text
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Enter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Explore Our Services',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 16),
              Text(
                'Discover how we can help you achieve your streamlined Financial Operation.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Learn More',
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