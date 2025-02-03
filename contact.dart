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
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyAddressController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _officeLocationController = TextEditingController();
  final TextEditingController _serviceDayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobilePhoneController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyAddressController.dispose();
    _businessTypeController.dispose();
    _officeLocationController.dispose();
    _serviceDayController.dispose();
    _emailController.dispose();
    _mobilePhoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String companyName = _companyNameController.text;
      String companyAddress = _companyAddressController.text;
      String businessType = _businessTypeController.text;
      String officeLocation = _officeLocationController.text;
      String serviceDay = _serviceDayController.text;
      String email = _emailController.text;
      String mobilePhone = _mobilePhoneController.text;

      print('Company Name: $companyName');
      print('Company Address: $companyAddress');
      print('Business Type: $businessType');
      print('Office Location: $officeLocation');
      print('Anticipated Service Day: $serviceDay');
      print('Contact Email: $email');
      print('Contact Mobile Phone: $mobilePhone');

      // Here you would typically send the data to a server or save it locally
      // For now, we'll just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Please let us know your needs.',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Company Name
                    controller: _companyNameController,
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your company name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Company Address
                    controller: _companyAddressController,
                    decoration: const InputDecoration(
                      labelText: 'Company Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your company address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Business Type
                    controller: _businessTypeController,
                    decoration: const InputDecoration(
                      labelText: 'Business Type',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your business type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Office Location
                    controller: _officeLocationController,
                    decoration: const InputDecoration(
                      labelText: 'Office Location',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your office location';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Anticipated Service Day
                    controller: _serviceDayController,
                    decoration: const InputDecoration(
                      labelText: 'Anticipated Service Day',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your anticipated service day';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Email
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Contact Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // You might want to add more email validation here.
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField( // Mobile Phone
                    controller: _mobilePhoneController,
                    decoration: const InputDecoration(
                      labelText: 'Contact Mobile Phone',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile phone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
