import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/education_controller.dart';
import '../../model/education.dart';

class EducationPreviewPage extends StatefulWidget {
  const EducationPreviewPage({Key? key}) : super(key: key);

  @override
  State<EducationPreviewPage> createState() => _EducationPreviewPageState();
}

class _EducationPreviewPageState extends State<EducationPreviewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EducationModel>>(
      future: Provider.of<EducationProvider>(context, listen: false)
          .loadEducationList(),
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
          final List<EducationModel> educationList = snapshot.data!;
          // Now you have the education list, you can display it however you want
          return Card(
            child: ListView.builder(
              itemCount: educationList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('School Name: ${educationList[index].school}'),
                    ),
                   Row(children: [ Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text('School Name: ${educationList[index].years}'),
                   ),SizedBox(width: 10,),Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text('School Name: ${educationList[index].years}'),
                   )],),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Department Name: ${educationList[index].department}'),
                    ),
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
