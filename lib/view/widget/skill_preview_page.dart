import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/language_controller.dart';
import 'package:resume_builder_app/controller/person_controller.dart';
import 'package:resume_builder_app/controller/skill_controller.dart';
import 'package:resume_builder_app/model/language.dart';
import 'package:resume_builder_app/model/person.dart';
import 'package:resume_builder_app/model/skill.dart';
import '../../controller/education_controller.dart';
import '../../model/education.dart';

class SkillPreviewPage extends StatefulWidget {
  const SkillPreviewPage({Key? key}) : super(key: key);

  @override
  State<SkillPreviewPage> createState() => _SkillPreviewPageState();
}

class _SkillPreviewPageState extends State<SkillPreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Skill>>(
      future: Provider.of<SkillProvider>(context, listen: false)
          .loadSkillList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final List<Skill> skillList = snapshot.data!;
          // Now you have the education list, you can display it however you want
          return Card(
            child: ListView.builder(
              itemCount: skillList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Skill Name: ${skillList[index].skillName}'),
                    ),
                    Row(children: [ Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Proficiency: ${skillList[index].proficiency}'),
                    )],),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
