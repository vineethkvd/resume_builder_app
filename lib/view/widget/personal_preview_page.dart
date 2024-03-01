import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/language_controller.dart';
import 'package:resume_builder_app/controller/person_controller.dart';
import 'package:resume_builder_app/model/language.dart';
import 'package:resume_builder_app/model/person.dart';
import '../../controller/education_controller.dart';
import '../../model/education.dart';

class PersonalPreviewPage extends StatefulWidget {
  const PersonalPreviewPage({Key? key}) : super(key: key);

  @override
  State<PersonalPreviewPage> createState() => _PersonalPreviewPageState();
}

class _PersonalPreviewPageState extends State<PersonalPreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Person>>(
      future: Provider.of<PersonProvider>(context, listen: false)
          .loadPersonList(),
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
          final List<Person> personList = snapshot.data!;
          // Now you have the education list, you can display it however you want
          return Card(
            child: Expanded(
              child: ListView.builder(
                itemCount: personList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Name: ${personList[index].name}'),
                      ),
                      Row(children: [ Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Address: ${personList[index].address}'),
                      )],),
                      Row(children: [ Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Email: ${personList[index].email}'),
                      )],),
                      Row(children: [ Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('Phone: ${personList[index].phone}'),
                      )],),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
