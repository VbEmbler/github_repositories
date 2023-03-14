import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:github_repositories/presentation/utils/markdown_heading_builder.dart';
import 'package:github_repositories/presentation/widgets/remote_error.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_repositories/domain/state/repository/repository_screen_state.dart';
import 'package:github_repositories/internal/dependencies/screens/repository_screen_module.dart';
import 'package:github_repositories/presentation/screens/home_screen_mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';


class RepositoryScreen extends StatelessWidget {
  final String accessToken;
  final String ownerLogin;
  final String repositoryName;

  const RepositoryScreen(
      {required this.accessToken,
      required this.ownerLogin,
      required this.repositoryName,
      super.key});

  @override
  Widget build(BuildContext context) {
    final RepositoryScreenState repositoryScreenState =
        RepositoryScreenModule.repositoryScreenState();

    ScrollController scrollController = ScrollController();

    repositoryScreenState.getRepository(
        accessToken: accessToken,
        ownerLogin: ownerLogin,
        repositoryName: repositoryName
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        leadingWidth: 26,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/back.svg',
              //fit: BoxFit.fill,
              height: 14,
              width: 36,
              colorFilter: const ColorFilter.mode(Color(0xFF007AFF), BlendMode.srcIn),
            ),
          ),
        ),
        title: Text(repositoryName,
            style: const TextStyle(
                fontFamily: 'SFProText',
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Color(0xFFFFFFFF)
            )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                repositoryScreenState.deleteAccessToken();
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
            ),
          )
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(height: 1, color: Color(0xFF21262D), thickness: 1),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (repositoryScreenState.hasErrorRepository) {
            return Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 150),
                    child: remoteError(
                      hasData: true,
                      isConnectionError: repositoryScreenState.isConnectionError,
                      errorPrefix: repositoryScreenState.errorPrefixRepository,
                      errorMessage: repositoryScreenState.errorMessageRepository,
                    )
                )
            );
          }
          if (repositoryScreenState.isRepositoryLoading) {
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
          } else {
            repositoryScreenState.getRepositoryReadme(
                accessToken: accessToken,
                ownerLogin: ownerLogin,
                repositoryName: repositoryName);
            return OrientationBuilder(
              builder: (context, orientation) {
                return Padding(
                  padding: orientation == Orientation.portrait
                      ? const EdgeInsets.only(left: 8, top: 24, right: 8)
                      : const EdgeInsets.only(left: 8, top: 2, right: 8),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/images/link.svg'),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              child: Text(
                                repositoryScreenState.repository?.htmlUrl
                                    ?? LocaleKeys.url_is_missing.tr(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Color(0xFF58A6FF),
                                    fontFamily: 'SFProText',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              onTap: () {
                                if (repositoryScreenState.repository?.htmlUrl != null
                                    && repositoryScreenState.repository!.htmlUrl != ''
                                    && repositoryScreenState.repository!.htmlUrl!.startsWith('http')) {
                                  launchUrlString(
                                      repositoryScreenState.repository!.htmlUrl!);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: orientation == Orientation.portrait
                          ? const EdgeInsets.only(left: 10, top: 25, right: 10)
                          : const EdgeInsets.only(left: 10, top: 2, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/images/license.svg',
                                width: 20,
                                height: 18,
                              ),
                              const SizedBox(width: 6),
                              Text(LocaleKeys.license.tr(),
                                  style: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Color(0xFFFFFFFF)
                                  )
                              ),
                            ],
                          ),
                          Text(
                              repositoryScreenState.repository?.license?.name
                                  ?? LocaleKeys.no_license.tr(),
                              style: const TextStyle(
                                  fontFamily: 'SFProText',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Color(0xFFFFFFFF)
                              )
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: orientation == Orientation.portrait
                          ? const EdgeInsets.only(left: 10, top: 25, right: 10)
                          : const EdgeInsets.only(left: 10, top: 2, right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/star.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    '${repositoryScreenState.repository?.stargazersCount} ',
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFFFAD876))),
                                Text(
                                    LocaleKeys.stars.tr(),
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF)
                                    )
                                )
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/fork.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    '${repositoryScreenState.repository?.forksCount} ',
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFF6ED370))),
                                Text(LocaleKeys.forks.tr(),
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF)))
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.end,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/watchers.svg',
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                    '${repositoryScreenState.repository?.watchersCount} ',
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xFF9CFFF9))),
                                 Text(LocaleKeys.watchers.tr(),
                                    style: const TextStyle(
                                        fontFamily: 'SFProText',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFFFFFFFF)
                                    )
                                 )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Observer(builder: (context) {
                      if (repositoryScreenState.isReadmeLoading) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 34),
                          child: Center(
                            child: SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                    color: Color(0xFFFFFFFF))
                            ),
                          ),
                        );
                      }
                      if (repositoryScreenState.readmeContentInMarkdown == ''
                          || repositoryScreenState.readmeContentInMarkdown == null) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 26),
                          child: Text(
                            LocaleKeys.no_readme.tr(),
                            style: TextStyle(
                              fontFamily: 'SFProText',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: const Color(0xFFFFFFFF).withOpacity(0.8),
                            ),
                          ),
                        );
                      }
                      if (repositoryScreenState.hasErrorReadme) {
                        return Expanded(
                          child: Center(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 150
                                ),
                                child: remoteError(
                                  hasData: true,
                                  isConnectionError: repositoryScreenState.isConnectionError,
                                  errorPrefix: repositoryScreenState.errorPrefixReadme,
                                  errorMessage: repositoryScreenState.errorMessageReadme,
                                )),
                          ),
                        );
                      }
                      return Expanded(
                        child: OrientationBuilder(
                          builder: (context, orientation) { return Padding(
                            padding: orientation == Orientation.portrait
                                ? const EdgeInsets.only(top: 25)
                                : const EdgeInsets.only(top: 2),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: MarkdownBody(
                                data: repositoryScreenState.readmeContentInMarkdown!,
                                onTapLink: (text, url, title) {
                                  if (url!.startsWith('#')) {
                                    final GlobalKey? headerKey;
                                    if (repositoryScreenState.markdownHeaders[text] != null) {
                                      headerKey = repositoryScreenState.markdownHeaders[text]!;
                                      final targetContext = headerKey.currentContext;
                                      if (targetContext != null) {
                                        Scrollable.ensureVisible(
                                          targetContext,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    }
                                  } else {
                                    String urlString = url;
                                    if (!url.startsWith('http')) {
                                      urlString = repositoryScreenState.mainUrl + urlString;
                                    }
                                    launchUrlString(urlString);
                                  }
                                },
                                imageBuilder: (uri, title, alt) {
                                  String uriString = uri.toString();
                                  if (!uriString.startsWith('http')) {
                                    uriString = repositoryScreenState.downloadPath + uriString;
                                  }
                                  return (uriString.contains('.png'))
                                      ? CachedNetworkImage(
                                          imageUrl: uriString,
                                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  const CircularProgressIndicator(
                                                      color: Color(0xFFFFFFFF)
                                                  ),
                                          errorWidget: (context, url, error) {
                                            return const Icon(Icons.error);
                                          },
                                        )
                                      : ScalableImageWidget.fromSISource(
                                          onLoading: (context) =>
                                              const CircularProgressIndicator(color: Color(0xFFFFFFFF)),
                                          si: ScalableImageSource.fromSvgHttpUrl(Uri.parse(uriString)),
                                          onError: (context) =>  const Icon(Icons.error)
                                  );
                                },
                                builders: <String, MarkdownElementBuilder>{
                                  'h1': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                  'h2': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                  'h3': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                  'h4': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                  'h5': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                  'h6': MarkdownHeadingBuilder(repositoryScreenState: repositoryScreenState),
                                },
                                styleSheet: MarkdownStyleSheet(
                                  h1: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  h2: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  h3: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  h4: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  h5: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  h6: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 23,
                                      color: Color(0xFFFFFFFF)),
                                  p: const TextStyle(
                                      fontFamily: 'SFProText',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF)),
                                    codeblockDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                  blockquoteDecoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                  code: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'SFProText',
                                    backgroundColor: Color(0xFF0D1117),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ); },
                        ),
                      );
                    })
                  ],
                ),
              ); },
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Observer(builder: (context) {
        return Visibility(
          visible: repositoryScreenState.hasErrorRepository
              || repositoryScreenState.hasErrorReadme,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                  child: Text(LocaleKeys.retry.tr()),
                  onPressed: () {
                    repositoryScreenState.getRepository(
                        accessToken: accessToken,
                        ownerLogin: ownerLogin,
                        repositoryName: repositoryName);
                  }
                ),
            ),
          ),
        );
      }),
    );
  }
}
