import 'package:flutter/material.dart';
import 'package:flutter_lab/Service Design/home.dart';

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
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<Map<String, dynamic>> _items = [
    {
      'title': '3 documents to check',
      'imagePath': 'images/ServiceDesign/accounting.jpg',
      'page': const Document(),
    },
    {
      'title': '4 bookings to confirm',
      'imagePath': 'images/ServiceDesign/accounting2.jpg',
      'page': const Accounting(),
    },
    {
      'title': '5 external E-mails to reply',
      'imagePath': 'images/ServiceDesign/accounting3.jpg',
      'page': const Communication(),
    },
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back to the office!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              "Here are the tasks to complete",
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,// Center the text
            ),
            const SizedBox(height: 24),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item['title']),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item['page']),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Details',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _items.map((item) => _buildImageWithLink(
                item['imagePath'],
                item['page'],
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithLink(String imagePath, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (page is Document) {
                return const Document();
              } else if (page is Accounting) {
                return const Accounting();
              } else if (page is Communication) {
                return const Communication();
              } else {
                return page; // Default case (shouldn't happen)
              }
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8), // Corrected typo here!
          Text(
            page.runtimeType.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
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