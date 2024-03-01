import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/language.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController proficiencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Add language details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Language Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter language name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: proficiencyController,
              decoration: InputDecoration(labelText: 'Proficiency'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter proficiency';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final Language language = Language(
                      name: nameController.text,
                      proficiency: int.parse(proficiencyController.text),
                    );
                    // Provider.of<LanguageProvider>(context, listen: false)
                    //     .submitLanguageDetails(language);
                    // Provider.of<LanguageProvider>(context, listen: false).saveLanguageList();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Language details saved')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
