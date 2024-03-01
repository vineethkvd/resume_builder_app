import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/education_controller.dart';
import 'package:resume_builder_app/controller/person_controller.dart';
import 'package:resume_builder_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EducationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PersonProvider(),
        ),
      ],
      child: MaterialApp(home: HomePage()),
    );
  }
}
