import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havillah/core/app_color.dart';

class CustomContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const CustomContainer(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      padding: const EdgeInsets.all(9.74),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            transform: const GradientRotation(20),
            colors: [
              AppColor.primaryColor,
              AppColor.primaryColorShade1.withOpacity(.6)
            ]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 3,
          ),
          Image.asset(
            imagePath,
            height: 50,
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 57,
            width: 120,
            child: Text(
              title,
              style: GoogleFonts.baskervvilleTextTheme().bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    fontSize: 17,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              style: GoogleFonts.baskervvilleTextTheme().bodyMedium!.copyWith(
                    color: AppColor.whiteColor,
                    fontSize: 11.3,
                  ),
            ),
          ),
        ],
      )),
    );
  }
}
