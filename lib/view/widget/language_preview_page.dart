import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/language_controller.dart';
import 'package:resume_builder_app/model/language.dart';
import '../../controller/education_controller.dart';
import '../../model/education.dart';

class LanguagePreviewPage extends StatefulWidget {
  const LanguagePreviewPage({Key? key}) : super(key: key);

  @override
  State<LanguagePreviewPage> createState() => _LanguagePreviewPageState();
}

class _LanguagePreviewPageState extends State<LanguagePreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Language>>(
      future: Provider.of<LanguageProvider>(context, listen: false)
          .loadLanguageList(),
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
          final List<Language> langList = snapshot.data!;
          // Now you have the education list, you can display it however you want
          return Card(
            child: ListView.builder(
              itemCount: langList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Name of language: ${langList[index].name}'),
                    ),
                    Row(children: [ Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Proficiency: ${langList[index].proficiency}'),
                    ),SizedBox(width: 10,)],),
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
