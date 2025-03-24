import 'package:flutter/material.dart';
import 'congrat.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dobController = TextEditingController();
  String? dob;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          TextFormField(
            // The validator receives the text that the user has entered.
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder()
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 50),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder()
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (!(value.contains('@') && value.contains('.com'))) {
                return 'Email invalid';
              }
            },
          ),
          SizedBox(height: 50),
          TextFormField(
            controller: dobController,
            decoration: const InputDecoration(
              labelText: 'Date of Birth',
              hintText: 'MM/DD/YYYY',
              border: OutlineInputBorder(),
            ),
            onTap: () async {
              DateTime? dobPicked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),
              );
              if (dobPicked != null) {
                setState(() {
                  dobController.text = '${dobPicked.month}/${dobPicked.day}/${dobPicked.year}';
                });
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          SizedBox(height: 50),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder()
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (value.length > 10) {
                return 'Password is too long. Max 10 character.';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CongratScreen()),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}