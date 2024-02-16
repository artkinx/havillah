import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:havillah/core/navigation_service.dart';
import 'package:havillah/presentation/signin/cubit/sign_in_cubit.dart';
import 'package:havillah/presentation/signin/sign_in_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.instance.navigatorKey,
        home: const Scaffold(
          body: SignInPage(),
        ),
      ),
    );
  }
}
