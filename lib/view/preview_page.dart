import 'package:flutter/material.dart';
import 'package:resume_builder_app/view/widget/personal_preview_page.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Resume preview page",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
            height: double.infinity,
            child: Column(
          children: [PersonalPreviewPage()],
        )),
      ),
    );
  }
}
