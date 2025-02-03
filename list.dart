import 'package:flutter/material.dart';

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
      home: const ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ToDoListPage> {
  final List<String> _items = [
    '3 documents to check',
    '4 bookings to confirm',
    '5 external E-mails to reply',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List of Items',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Expanded( // Use Expanded to fill available space
              flex: 1, // Give the list some weight
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_items[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Images with Links',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            // Wrap images in a Row to display them horizontally.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // Distribute space evenly
              children: [
                _buildImageWithLink(
                    'images/ServiceDesign/accounting.jpg', 'Document', const Document()),
                _buildImageWithLink(
                    'images/ServiceDesign/accounting2.jpg', 'Accounting', const Accounting()),
                _buildImageWithLink(
                    'images/ServiceDesign/accounting3.jpg', 'Communication', const Communication()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithLink(String imagePath, String pageName, Widget page) {
    return InkWell( // Use InkWell for tap functionality
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100, // Adjust image size as needed
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Add rounded corners
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(pageName),
        ],
      ),
    );
  }
}

// Placeholder pages. Replace these with your actual pages.
class Document extends StatelessWidget {
  const Document({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Document')),
      body: const Center(child: Text('Content of Document')),
    );
  }
}

class Accounting extends StatelessWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accounting')),
      body: const Center(child: Text('Content of Accounting')),
    );
  }
}

class Communication extends StatelessWidget {
  const Communication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Communication')),
      body: const Center(child: Text('Content of Communication')),
    );
  }
}