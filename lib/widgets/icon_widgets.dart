import 'package:flutter/material.dart';

import '../constants/colors.dart';

class IconWidgets extends StatelessWidget {
  final String image;
  IconWidgets({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 30,
      width: 30,
      color: AppColors().iconColor,
      image: AssetImage(image),
    );
  }
}