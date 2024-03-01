import 'package:flutter/material.dart';
import 'package:resume_builder_app/view/widget/education_preview_page.dart';
import 'package:resume_builder_app/view/widget/language_preview_page.dart';
class PreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Preview'),
      ),
      body: ListView(
        children: const [
          LanguagePreviewPage(),
          EducationPreviewPage(),
          // Other preview pages here if needed
        ],
      ),
    );
  }
}