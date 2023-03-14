import 'package:flutter/material.dart';
import 'package:github_repositories/generated/codegen_loader.g.dart';
import 'package:github_repositories/internal/application.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const Application(),
    ),
  );
}
