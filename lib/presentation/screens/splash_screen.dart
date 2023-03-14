import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repositories/domain/state/splash_screen/splash_screen_state.dart';
import 'package:github_repositories/internal/dependencies/screens/splash_screen_module.dart';
import 'package:github_repositories/presentation/screens/home_screen_mobx.dart';
import 'package:github_repositories/presentation/screens/repositories_screen.dart';

const splashDelay = 5;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenState splashScreenState = SplashScreenModule.splashScreenState();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: splashDelay), () async {
      await splashScreenState.getAccessToken();
      String? accessToken = splashScreenState.accessToken;
      if (context.mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          if (accessToken != null && accessToken != '') {
            return RepositoriesScreen(accessToken: accessToken);
          } else {
            return HomeScreenMobx();
          }
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SvgPicture.asset('assets/images/splash.svg'))
    );
  }
}
