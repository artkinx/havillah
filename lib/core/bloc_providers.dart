import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havillah/presentation/signin/cubit/sign_in_cubit.dart';
import 'package:havillah/presentation/signin/sign_in_page.dart';

class BlocProviders {
  static List<BlocProvider> create(BuildContext context) {
    return <BlocProvider>[
      BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignInPage(),
      )
    ];
  }
}
