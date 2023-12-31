import 'package:acrosstheglobe_assignment1/constants/colors.dart';
import 'package:acrosstheglobe_assignment1/constants/images.dart';
import 'package:acrosstheglobe_assignment1/controller/lessons_provider.dart';
import 'package:acrosstheglobe_assignment1/models/lessons_model.dart';
import 'package:acrosstheglobe_assignment1/models/programs_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/image_icon.dart';
import '../controller/programs_provider.dart';
import '../widgets/functionalities_widgets.dart';
import '../widgets/icon_widgets.dart';
import '../widgets/title_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //images for programs
  List<String> programImages = [
    Images().image1,
    Images().image2,
  ];
  List<Color> programColors = [AppColors().greyColor, AppColors().orangeColor];
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<ProgramsProvider>(context);
    final lessonProvider = Provider.of<LessonProvider>(context);
    return Scaffold(
        backgroundColor: AppColors().scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors().homeAppBar,
          elevation: 0,
          leadingWidth: 50,
          //menu icon
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconWidgets(image: ImageIcons().menu),
          ),
          actions: [
            //chat icon
            IconWidgets(image: ImageIcons().chat),
            const SizedBox(
              width: 25,
            ),
            //notification icon
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconWidgets(image: ImageIcons().notification),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //greetings to the user
              Container(
                color: AppColors().homeAppBar,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleWidget(
                      title: 'Hello Priya!',
                      fontSize: 35,
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    SubTitleWidget(
                      title: 'What you wanna learn today?',
                    )
                  ],
                ),
              ),
              //funcionalities widgets
              const functionalities(),
              //programs list view
              const ListviewTitleWidget(title: 'Programs for you'),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                height: 339,
                width: double.infinity,
                child: appProvider.programResult.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        clipBehavior: Clip.none,
                        itemCount: appProvider.programResult.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ProgramsModel current =
                              appProvider.programResult[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.0,
                                  offset: const Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            margin: const EdgeInsets.only(right: 20),
                           // height: 360,
                            width: 300,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //picture
                                  Container(
                                    height: 190,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                programImages[index % 2]),
                                            fit: BoxFit.cover),
                                        color: programColors[index % 2]),
                                  ),
                                  //content
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          current.category!,
                                          style: TextStyle(
                                              color: AppColors().blueColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: double.maxFinite,
                                          child: Text(
                                            current.name!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SubTitleWidget(
                                          title: '${current.lesson!} Lessons',
                                          fontSize: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
              ),
              //Events and experience list view
              const ListviewTitleWidget(title: 'Events and Experience'),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                height: 364,
                width: double.infinity,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(right: 20),
                    width: 300,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //picture
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    programImages[index % 2],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          //content
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BABYCARE',
                                  style: TextStyle(
                                      color: AppColors().blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    'Understanding of human behaviour',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SubTitleWidget(
                                      title: '13 Feb, Sunday',
                                      fontSize: 15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors().blueColor)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: Text(
                                        'BOOK',
                                        style: TextStyle(
                                            color: AppColors().blueColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Lessons list view
              const ListviewTitleWidget(title: 'Lessons for you'),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                height: 355,
                width: double.infinity,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  itemCount: lessonProvider.lessonResult.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    LessonModel current = lessonProvider.lessonResult[index];
                    return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3.0,
                          spreadRadius: 2.0,
                          offset: const Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: const EdgeInsets.only(right: 20),
                   // height: 370,
                    width: 300,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //picture
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(
                                    programImages[index % 2],
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          //content
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  current.category!,
                                  style: TextStyle(
                                      color: AppColors().blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                 SizedBox(
                                  height: 40,
                                  width: double.maxFinite,
                                  child: Text(
                                    current.name!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     SubTitleWidget(
                                      title: '${current.duration!} min',
                                      fontSize: 15,
                                    ),
                                    Icon(
                                     current.locked!? Icons.lock_open: Icons.lock,
                                      color: AppColors().iconColor,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  }
                ),
              ),
            ],
          ),
        ));
  }
}
