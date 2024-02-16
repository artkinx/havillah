import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havillah/core/helpers/http_helper.dart';
import 'package:havillah/core/navigation_service.dart';
import 'package:havillah/presentation/home/home_page/home_page_page.dart';
import 'package:havillah/requests/sign_in_request.dart';
import 'package:havillah/response/login_response.dart';
import 'package:motion_toast/motion_toast.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signin(Map<String, dynamic> req, BuildContext context) async {
    try {
      var request = SignInRequest.fromJson(req);

      var response = await HttpHelper.makePostHttp(request.toJson());

      print(response);

      var resp = LoginResponse.fromJson(jsonDecode(response));

      if (resp.apistatus == 200) {
        NavigationService.instance.routeToPage(const HomePagePage());

        // ignore: use_build_context_synchronously
        MotionToast.success(
                title: const Text("Success"),
                description: const Text("You are welcome..."))
            .show(context);
      } else {
        // ignore: use_build_context_synchronously
        MotionToast.error(
                title: const Text("Error"),
                description: Text(resp.errors!.errortext!))
            .show(context);
      }
      // NavigationService().routeToPage(const HomePagePage());
    } catch (e) {
      print(e);
    }
  }

  Future mockLogin() async {
    await NavigationService.instance.routeToPage(
      const HomePagePage(),
    );
  }
}
