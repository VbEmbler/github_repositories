// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "personal_access_token": "Personal access token",
  "field_cannot_be_empty": "Field cannot be empty",
  "invalid_token": "Invalid Token",
  "sign_in": "Sign In",
  "ok": "Ok",
  "moved_permanently": "Moved permanently.",
  "http_error_occurred": "HTTP error occurred.",
  "invalid_data_format": "Invalid data format.",
  "request_timeout": "Request timeout.",
  "bad_request": "Bad request.",
  "unable_to_process_the_request": "Unable to process the request.",
  "api_not_responding": "Api not responding.",
  "unauthorized_request": "Unauthorized request.",
  "page_not_found": "Page not found.",
  "check_your_internet_connection": "Check your Internet connection.",
  "connection_error": "Connection error",
  "please_send_this_message_to_developer": "Please send this message to developer.",
  "error": "Error",
  "repositories": "Repositories",
  "empty": "Empty",
  "no_repositories_at_the_moment": "No repositories at the moment",
  "retry": "Retry",
  "refresh": "Refresh",
  "url_is_missing": "Url is missing.",
  "license": "License",
  "no_license": "No license",
  "stars": "stars",
  "forks": "forks",
  "watchers": "watchers",
  "no_readme": "No Readme.md",
  "no_data": "No data."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
