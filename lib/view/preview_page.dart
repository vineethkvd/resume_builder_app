import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/person_controller.dart';
import 'package:resume_builder_app/model/person.dart';
import 'package:resume_builder_app/view/widget/education_preview_page.dart';
import 'package:resume_builder_app/view/widget/language_preview_page.dart';
import 'package:resume_builder_app/view/widget/personal_preview_page.dart';

class PreviewPage extends StatefulWidget {
  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late Future<List<Person>> educationList; // Declare as Future<List<Person>>

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Resume Preview'),
        ),
        body: Container(
          child: Column(children: [PersonalPreviewPage()]),
        ));
  }
}
