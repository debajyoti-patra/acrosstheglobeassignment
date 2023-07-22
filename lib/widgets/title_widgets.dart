import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class SubTitleWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  const SubTitleWidget(
      {super.key, this.title = 'View all', this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: AppColors().iconColor, fontSize: fontSize),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleWidget({
    super.key,
    required this.title,
    this.fontSize = 27,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          GoogleFonts.ptSerif(fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}

class ListviewTitleWidget extends StatelessWidget {
  final String title;
  const ListviewTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleWidget(
            title: title,
            fontSize: 20,
          ),
          Row(
            children: [
              const SubTitleWidget(
                fontSize: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors().iconColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
