import 'package:flutter/material.dart';
import 'package:resume_builder_app/view/education_detail_page.dart';
import 'package:resume_builder_app/view/language_detail_page.dart';
import 'package:resume_builder_app/view/person_detail_apge.dart';
import 'package:resume_builder_app/view/preview_page.dart';
import 'package:resume_builder_app/view/skill_detail_page.dart';
import 'package:resume_builder_app/view/widget/education_preview_page.dart';
import 'package:resume_builder_app/view/widget/personal_preview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Resume Builder",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add Personal details")
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EducationScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.school),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add Education details")
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LanguageScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.person),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add Language details")
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SkillScreen(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.sports_gymnastics),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Add Skills")
                        ]),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonalPreviewPage(),
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("View Resume")
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
