import 'package:e_learning_app_ui/datas/courses_json.dart';
import 'package:e_learning_app_ui/theme/colors.dart';
import 'package:e_learning_app_ui/theme/padding.dart';
import 'package:e_learning_app_ui/widgets/custom_heading.dart';
import 'package:e_learning_app_ui/widgets/custom_my_courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  _MyCoursesPageState createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
       // brightness: Brightness.light,
        systemOverlayStyle: SystemUiOverlayStyle.light,

        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
  //  var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        children: [
          const SizedBox(height: spacer - 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomHeading(
                title: 'My Courses',
                subTitle: 'Let\'s continue, shall we?',
                color: secondary,
              ),
              Text(
                MyCoursesJson.length.toString() + ' Courses',
                style: const TextStyle(color: secondary, fontSize: 15.0),
              ),
            ],
          ),

          const SizedBox(height: spacer),

          Column(
            children: List.generate(MyCoursesJson.length, (index) {
              var data = MyCoursesJson[index];
          //    List lecturer = Code['popular_lecturer'] as List;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: CustomMyCoursesCard(
                    image: data['image'],
                    title: data['title'],
                    instructor: data['user_name'],
                    videoAmount: data['video'],
                    percentage: data['percentage'],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}