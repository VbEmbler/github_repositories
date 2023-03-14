import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories/presentation/screens/splash_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF0D1117),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0D1117)),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF5A9357),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: const Color(0xFF5A9357),
            foregroundColor: const Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        inputDecorationTheme: const InputDecorationTheme(
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xFFCB4F4F)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          focusedErrorBorder: OutlineInputBorder(
              //gapPadding: 1,
              borderSide: BorderSide(width: 1, color: Color(0xFFCB4F4F)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color(0xFF58A6FF),
          selectionHandleColor: Color(0xFF58A6FF),
          cursorColor: Color(0xFF58A6FF),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}