import 'package:e_learning_app_ui/datas/category_json.dart';
import 'package:e_learning_app_ui/datas/courses_json.dart';
import 'package:e_learning_app_ui/datas/user_profile.dart';
import 'package:e_learning_app_ui/theme/colors.dart';
import 'package:e_learning_app_ui/theme/padding.dart';
import 'package:e_learning_app_ui/widgets/clipper.dart';
 import 'package:e_learning_app_ui/widgets/custom_categories_button.dart';
 import 'package:e_learning_app_ui/widgets/custom_category_card.dart';
 import 'package:e_learning_app_ui/widgets/custom_course_card.dart';
 import 'package:e_learning_app_ui/widgets/custom_heading.dart';
 import 'package:e_learning_app_ui/widgets/custom_promotion_card.dart';
 import 'package:e_learning_app_ui/widgets/custom_search_field.dart';
 import 'package:e_learning_app_ui/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
         // brightness: Brightness.dark,
          systemOverlayStyle: SystemUiOverlayStyle.dark,

        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    var userName = UserProfile['full_name']!.split(' ');
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: spacer),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),

                child: Container(
                    width: size.width,
                    height: 300.0,
                    decoration: const BoxDecoration(
                      color: secondary,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: appPadding, right: appPadding),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: spacer + 24),
                    //heading
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomHeading(
                          title: 'Hi, ${userName[0]}!',
                          subTitle: 'Let\'s start learning.',
                          color: textWhite,
                        ),
                        SizedBox(
                            height: spacer,
                            width: spacer,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  UserProfile['image'].toString(),
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                    const SizedBox(height: spacer),

                    //search
                    const CustomSearchField(
                      hintField: 'Try "Web Design"',
                      backgroundColor: background,
                    ),
                     const SizedBox(height: spacer - 30.0),

                    //category card
                     const CustomCategoryCard(),
                  ],
                ),
              ),
            ],
          ),
           const SizedBox(height: spacer),

          //promotion card
           const CustomPromotionCard(),
           const SizedBox(height: spacer),

          //feature courses
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(
              title: 'Feature Course',
              arg: {
                'title': 'Feature Course!',
                'list': CoursesJson,
              },
            ),
          ),
          const SizedBox(height: smallSpacer),

          // courses cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding - 10.0,
            ),
            child: Wrap(
             // spacing: 10,
              children: List.generate(CoursesJson.length, (index) {
                var data = CoursesJson[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: CustomCourseCardExpand(
                      thumbNail: data['image'],
                      videoAmount: data['video'],
                      title: data['title'],
                      userProfile: data['user_profile'],
                      userName: data['user_name'],
                      price: data['price'],
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: spacer - 20.0),

          //categories
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(title: 'Categories'),
          ),
          const SizedBox(height: smallSpacer),
          Padding(
            padding: const EdgeInsets.only(left: appPadding-15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(
                left: appPadding,
                right: appPadding - 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(CategoryJson.length, (index) {
                    //  var data = AllCategories[index];
                     // var getData = data['data'];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomCategoriesButton(
                              title: CategoryJson[index]['title']),
                        ),
                      );
                    }),
                  ),
                  Row(
                    children: List.generate(CategoryJson.length, (index) {

                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: CustomCategoriesButton(
                              title: CategoryJson2[index]['title']),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: spacer - 10.0),



          //feature category
          const Padding(
            padding: EdgeInsets.only(left: appPadding, right: appPadding),
            child: CustomTitle(title: 'Design Courses'),
          ),
          const SizedBox(height: smallSpacer),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: appPadding,
              right: appPadding - 10.0,
            ),
            child: Wrap(
              children: List.generate(CoursesJson.length, (index) {
                var data = CoursesJson[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 20.0),
                  child: GestureDetector(


                    child: CustomCourseCardExpand(
                      thumbNail: data['image'],
                      videoAmount: data['video'],
                      title: data['title'],
                      userProfile: data['user_profile'],
                      userName: data['user_name'],
                      price: data['price'],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}