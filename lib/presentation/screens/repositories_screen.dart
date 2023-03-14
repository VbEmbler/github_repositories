import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repositories/domain/state/repositories/repositories_screen_state.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:github_repositories/internal/dependencies/screens/repositories_screen_module.dart';
import 'package:github_repositories/presentation/screens/home_screen_mobx.dart';
import 'package:github_repositories/presentation/screens/repository_screen.dart';
import 'package:github_repositories/presentation/widgets/remote_error.dart';

class RepositoriesScreen extends StatelessWidget {
  final String accessToken;
  const RepositoriesScreen({required this.accessToken, super.key});

  @override
  Widget build(BuildContext context) {
    final RepositoriesScreenState repositoriesScreenState =
        RepositoriesScreenModule.repositoriesScreenState();
    repositoriesScreenState.getRepositories(accessToken: accessToken);
    repositoriesScreenState.setColorsMap();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
            LocaleKeys.repositories.tr(),
            style: const TextStyle(
                fontFamily: 'SFProText',
                fontWeight: FontWeight.w600,
                fontSize: 17.0,
                color: Color(0xFFFFFFFF)
            )
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  repositoriesScreenState.deleteAccessToken();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreenMobx())
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/exit.svg',
                  height: 24,
                  width: 24,
                ),
              )
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(height: 1, color: Color(0xFF21262D), thickness: 1),
        ),
      ),
      body: Observer(builder: (context) {
        if (repositoriesScreenState.isLoading) {
          return const Center(
              child: SizedBox(
                  height: 56.0,
                  width: 56.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 8.0,
                    color: Color(0xFFFFFFFF),
                  )
              )
          );
        }
        if (repositoriesScreenState.hasError) {
          return Center(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 150),
                  child: remoteError(
                    hasData: repositoriesScreenState.hasRepositories,
                    isConnectionError: repositoriesScreenState.isConnectionError,
                    errorPrefix: repositoriesScreenState.errorPrefix,
                    errorMessage: repositoriesScreenState.errorMessage,
                  )
              )
          );
        }
        return ListView.builder(
          itemCount: repositoriesScreenState.repositories?.length,
          itemBuilder: (context, index) {
            Color? colorFromLanguage =
                repositoriesScreenState.getColorByLanguage(
                    language: repositoriesScreenState.repositories?[index].language ?? '');
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RepositoryScreen(
                          accessToken: accessToken,
                          ownerLogin: repositoriesScreenState.owner?.login ?? '',
                          repositoryName: repositoriesScreenState.repositories?[index].name ?? '',
                        )
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 14.0)),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            repositoriesScreenState.repositories?[index].name ?? LocaleKeys.no_data.tr(),
                            style: const TextStyle(
                                fontFamily: 'SFProText',
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xFF58A6FF)
                            ),
                          ),
                        ),
                        Text(
                          repositoriesScreenState.repositories?[index].language
                              ?? LocaleKeys.no_data.tr(),
                          style: TextStyle(
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: colorFromLanguage ?? Colors.red
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Text(
                      textAlign: TextAlign.left,
                      repositoriesScreenState.repositories?[index].description ?? '',
                      style: const TextStyle(
                          fontFamily: 'SFProText',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: Color(0xFFFFFFFF)
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  const Divider(height: 1.0, color: Color(0xFF21262D), thickness: 1.0)
                ],
              ),
            );
          },
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (context) {
        return Visibility(
          visible: repositoriesScreenState.hasError,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                  child: Text(
                      repositoriesScreenState.hasRepositories
                      ? LocaleKeys.retry.tr()
                      : LocaleKeys.refresh.tr()
                  ),
                  onPressed: () {
                    repositoriesScreenState.getRepositories(accessToken: accessToken);
                  }
                ),
            ),
          ),
        );
      }),
    );
  }
}
