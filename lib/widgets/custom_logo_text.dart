import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havillah/core/app_color.dart';
import 'package:havillah/core/constants.dart';

class CustomLogoText extends StatelessWidget {
  const CustomLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 40),
        Image.asset(
          Constants.appLogo,
          height: 50,
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.logoText,
              style: GoogleFonts.poppinsTextTheme().bodyMedium!.copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text(
              Constants.logoTextSub,
              style: GoogleFonts.poppinsTextTheme().bodyMedium!.copyWith(
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
