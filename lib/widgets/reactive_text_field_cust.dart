import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havillah/core/app_color.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveTextFieldCust extends StatefulWidget {
  final String lableText;
  final String formControlName;
  final String hintText;
  final bool obscureText;
  const ReactiveTextFieldCust({
    super.key,
    required this.lableText,
    required this.formControlName,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  State<ReactiveTextFieldCust> createState() => _ReactiveTextFieldCustState();
}

class _ReactiveTextFieldCustState extends State<ReactiveTextFieldCust> {
  @override
  Widget build(BuildContext context) {
    Icon icon = const Icon(FontAwesomeIcons.eye);

    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.lableText,
            style: GoogleFonts.poppinsTextTheme()
                .displayMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.sizeOf(context).width,
            child: ReactiveTextField(
              formControlName: widget.formControlName,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                fillColor: AppColor.textFieldFillColor,
                hintText: widget.hintText,
                border: const OutlineInputBorder(),
                suffixIcon: widget.obscureText
                    ? InkWell(
                        onTap: () {
                          if (widget.obscureText) {
                            setState(() {
                              icon = icon.icon?.codePoint ==
                                          FontAwesomeIcons.eye.codePoint &&
                                      icon.icon?.fontPackage ==
                                          FontAwesomeIcons.eye.fontPackage
                                  ? const Icon(FontAwesomeIcons.eyeSlash)
                                  : const Icon(FontAwesomeIcons.eyeDropper);
                            });
                          }
                        },
                        child: icon,
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
