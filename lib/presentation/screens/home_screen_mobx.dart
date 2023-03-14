import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:github_repositories/internal/dependencies/screens/home_screen_module_mobx.dart';

import '../../domain/state/auth/home_screen_state.dart';
import 'repositories_screen.dart';

class HomeScreenMobx extends StatelessWidget {
  final HomeScreenState _homeScreenState =
      HomeScreenModuleMobX.homeScreenMobXState();
  HomeScreenMobx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 106)),
                    SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 84, width: 84
                    ),
                    const Padding(padding: EdgeInsets.only(top: 62)),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            child: Observer(
                              builder: (_) => TextField(
                                onChanged: (value) => _homeScreenState.accessToken = value,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 1.0,
                                      horizontal: 16
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF21262D)
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xFF58A6FF)
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  labelText: LocaleKeys.personal_access_token.tr(),
                                  labelStyle: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: const Color(0xFFFFFFFF).withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  errorText: _homeScreenState.accessTokenErrorMessage,
                                  errorStyle: const TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xFFCB4F4F),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Spacer(),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 16)),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5A9357),
                                  foregroundColor: const Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  )
                              ),
                              onPressed: () async {
                                _homeScreenState.validate();
                                if (!_homeScreenState.isAccessTokenValidated) {
                                  await _homeScreenState.auth();
                                  if (_homeScreenState.hasError && context.mounted) {
                                    showAlertDialog(
                                        context,
                                        _homeScreenState.errorMessage,
                                        _homeScreenState.errorPrefix);
                                  }
                                  if (_homeScreenState.isLoaded && context.mounted) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                                RepositoriesScreen(
                                                    accessToken: _homeScreenState.accessToken
                                                )
                                        )
                                    );
                                  }
                                }
                              },
                              child: Observer(
                                builder: (context) {
                                  if (_homeScreenState.isLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: Color(0xFFFFFFFF)
                                      ),
                                    );
                                  }
                                  return Text(
                                    LocaleKeys.sign_in.tr(),
                                    style: const TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF)
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 16))
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 18))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context, String errorMessage, String errorPrefix) {
  Dialog errorDialog = Dialog(
    backgroundColor: const Color(0xFF0D1117).withOpacity(0.8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: const Color(0xFF0D1117).withOpacity(0.8),
      ),
      height: 141,
      width: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 7, right: 16, left: 16),
            child: Text(
              errorPrefix,
              style: const TextStyle(
                  fontFamily: 'SFProText',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
          SizedBox(
            height: 36,
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                  fontFamily: 'SFProText',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 14.0)),
          const Divider(color: Color(0xFF21262D), height: 0.5, thickness: 0.5),
          const Padding(padding: EdgeInsets.only(top: 10.5)),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(103, 22),
              maximumSize: const Size(103, 22),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              LocaleKeys.ok.tr(),
              style: const TextStyle(
                  fontFamily: 'SFProText',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Color(0xFF58A6FF)),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10))
        ],
      ),
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => errorDialog,
  );
}
