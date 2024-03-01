import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/education_controller.dart';
import '../model/education.dart';

class EducationScreen extends StatefulWidget {
  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController yearsController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

  TextEditingController departmentController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Add Education Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: yearsController,
              decoration: InputDecoration(labelText: 'Years'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter years';
                }
                return null;
              },
            ),
            TextFormField(
              controller: schoolController,
              decoration: InputDecoration(labelText: 'School'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter school';
                }
                return null;
              },
            ),
            TextFormField(
              controller: departmentController,
              decoration: InputDecoration(labelText: 'Department'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter department';
                }
                return null;
              },
            ),
            TextFormField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter grade';
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
                    final EducationModel educationModel = EducationModel(
                      years: yearsController.text,
                      school: schoolController.text,
                      department: departmentController.text,
                      grade: gradeController.text,
                    );
                    Provider.of<EducationProvider>(context, listen: false)
                        .submitEducationDetails(educationModel);
                    Provider.of<EducationProvider>(context, listen: false).saveEducationList();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Education details saved')),
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
