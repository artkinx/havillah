import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havillah/core/app_color.dart';
import 'package:havillah/presentation/signin/cubit/sign_in_cubit.dart';
import 'package:havillah/widgets/reactive_password_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/reactive_forms.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 23.0),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppinsTextTheme()
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 213,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColor.deepBrownColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: SizedBox(
                      width: 213,
                      height: 50,
                      child: DropdownButtonFormField(
                        alignment: AlignmentDirectional.center,
                        dropdownColor: AppColor.deepBrownColor,
                        style: GoogleFonts.poppinsTextTheme()
                            .labelMedium!
                            .copyWith(
                              color: AppColor.secondaryColor,
                            ),
                        onChanged: (value) {},
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        iconEnabledColor: AppColor.secondaryColor,
                        elevation: 0,
                        decoration: InputDecoration(
                            suffixIconColor: AppColor.secondaryColor,
                            prefixIconColor: AppColor.secondaryColor,
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                        items: const [
                          DropdownMenuItem(
                              value: "NeedProperty",
                              child: Text("I need a property")),
                          DropdownMenuItem(
                              value: "HaveProperty",
                              child: Text("I have a property")),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 160,
              ),
              Text(
                "Welcome back",
                style: GoogleFonts.poppinsTextTheme().headlineLarge!.copyWith(
                      color: AppColor.brownShade1,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ReactiveForm(
                  formGroup: ReactiveForms.form,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            CustomReactiveTextField(
                              formControlName: "username",
                              staticLabelText: "Username",
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter you username",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // ReactiveTextFieldCust(
                            //   lableText: "Password",
                            //   formControlName: "password",
                            //   hintText: "Enter your password",
                            //   obscureText: true,
                            // ),

                            CustomReactiveTextField(
                              formControlName: "password",
                              staticLabelText: "Password",
                              obscureText: true,
                              validationRuleBuilder: (rules, value) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Wrap(
                                    runSpacing: 8,
                                    spacing: 4,
                                    children: rules.map(
                                      (rule) {
                                        final ruleValidated =
                                            rule.validate(value);
                                        return Chip(
                                          label: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (ruleValidated) ...[
                                                const Icon(
                                                  Icons.check,
                                                  color: Color(0xFF0A9471),
                                                ),
                                                const SizedBox(width: 8),
                                              ],
                                              Text(
                                                rule.name,
                                                style: TextStyle(
                                                  color: ruleValidated
                                                      ? const Color(0xFF0A9471)
                                                      : const Color(0xFF9A9FAF),
                                                ),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: ruleValidated
                                              ? const Color(0xFFD0F7ED)
                                              : const Color(0xFFF4F5F6),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                );
                              },
                              validationRules: {
                                DigitValidationRule(),
                                UppercaseValidationRule(),
                                LowercaseValidationRule(),
                                MinCharactersValidationRule(6),
                                MaxCharactersValidationRule(12),
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter you password",
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(18.0, 0, 18.0, 30),
                            child: ReactiveFormConsumer(
                              builder: (conxt, f, child) => EasyButton(
                                idleStateWidget: const Text(
                                  'Elevated button',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                borderRadius: 20,
                                height: 60,
                                elevation: 3,
                                onPressed: f.hasErrors
                                    ? null
                                    : () async {
                                        await context
                                            .read<SignInCubit>()
                                            .signin(f.rawValue, context);
                                      },
                                buttonColor: f.hasErrors
                                    ? Colors.grey
                                    : AppColor.deepBrownColor,
                                loadingStateWidget:
                                    const CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
