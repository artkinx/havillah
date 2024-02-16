import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havillah/core/app_color.dart';
import 'package:havillah/core/constants.dart';
import 'package:havillah/widgets/custom_container.dart';
import 'package:havillah/widgets/custom_logo_text.dart';

class HomePagePage extends StatefulWidget {
  const HomePagePage({super.key});

  @override
  State<HomePagePage> createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          foregroundDecoration: const BoxDecoration(
            color: Colors.black26,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(
                Constants.back1,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 2.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomLogoText(),
                        const SizedBox(
                          height: 43,
                        ),
                        Text(
                          "BUYING PROPERTIES \nMADE EASY",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.baskervvilleTextTheme()
                              .headlineLarge!
                              .copyWith(
                                  color: AppColor.secondaryColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Take a tour>",
                        style: GoogleFonts.baskervvilleTextTheme()
                            .displayMedium!
                            .copyWith(
                              color: AppColor.secondaryColor,
                              fontSize: 17,
                            ),
                      ),
                      Text(
                        "Welcome, James",
                        style: GoogleFonts.baskervvilleTextTheme()
                            .displayMedium!
                            .copyWith(
                              color: AppColor.secondaryColor,
                              fontSize: 17,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.4,
                    child: GridView.count(
                      crossAxisSpacing: 30,
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      children: [
                        ...List.generate(
                          4,
                          (index) => switch (index) {
                            1 => CustomContainer(
                                imagePath: Constants.dev,
                                title: Constants.homeText2,
                                subTitle: Constants.homeSubText2),
                            2 => CustomContainer(
                                imagePath: Constants.financing,
                                title: Constants.homeText3,
                                subTitle: Constants.homeSubText3),
                            3 => CustomContainer(
                                imagePath: Constants.user,
                                title: Constants.homeText4,
                                subTitle: Constants.homeSubText4),
                            int() => CustomContainer(
                                imagePath: Constants.home,
                                title: Constants.homeText1,
                                subTitle: Constants.homeSubText1),
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
