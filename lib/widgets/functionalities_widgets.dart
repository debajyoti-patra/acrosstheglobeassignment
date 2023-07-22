import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/image_icon.dart';

class functionalities extends StatelessWidget {
  const functionalities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors().homeAppBar,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                functionlatiesCatagory(
                  title: 'Programs',
                  image: ImageIcons().agenda,
                ),
                 SizedBox(
                  width: 10,
                ),
                functionlatiesCatagory(
                  title: 'Get help',
                  image: ImageIcons().question,
                )
              ],
            ),
             SizedBox(
                  height: 10,
                ),
            Row(
              children: [
                functionlatiesCatagory(title: 'Learn',image: ImageIcons().bookSelect,),
                SizedBox(
                  width: 10,
                ),
                functionlatiesCatagory(
                  title: 'DD tracker',
                  isIcon: true,
                  icon: Icons.analytics,
                )
              ],
            )
          ],
        ));
  }
}

class functionlatiesCatagory extends StatelessWidget {
  final bool isIcon;
  final IconData? icon;
  final String? image;
  final String title;
  const functionlatiesCatagory({
    super.key,
    this.icon,
    required this.title,
    this.isIcon = false,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: AppColors().blueColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isIcon
                  ? Icon(
                      size: 30,
                      icon,
                      color: AppColors().blueColor,
                    )
                  : ImageIcon(
                    size:30,
                    color:AppColors().blueColor,
                      AssetImage(image!),
                    ),
                    SizedBox(width: 10,),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors().blueColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
