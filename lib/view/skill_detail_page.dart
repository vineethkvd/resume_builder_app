import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/skill.dart';

class SkillScreen extends StatefulWidget {
  @override
  _SkillScreenState createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController skillNameController = TextEditingController();
  TextEditingController proficiencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Add Skill Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: skillNameController,
              decoration: InputDecoration(labelText: 'Skill Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter skill name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: proficiencyController,
              decoration: InputDecoration(labelText: 'Proficiency'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter proficiency level';
                }
                return null;
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final Skill skill = Skill(
                    skillName: skillNameController.text,
                    proficiency: int.parse(proficiencyController.text),
                  );
                  // Provider.of<SkillProvider>(context, listen: false)
                  //     .submitSkillDetails(skill);
                  // Provider.of<SkillProvider>(context, listen: false).saveSkillList();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Skill details saved')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
