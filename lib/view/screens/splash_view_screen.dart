import 'package:flutter/material.dart';
import 'package:valorent_app/constants/app_constants.dart';
import 'package:valorent_app/view/screens/home.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppConstants.appLogo),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHomePage() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const RootScreen()));
    });
  }
}
