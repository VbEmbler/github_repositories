import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:github_repositories/domain/state/repository/repository_screen_state.dart';
import 'package:markdown/markdown.dart' as md;

class MarkdownHeadingBuilder extends MarkdownElementBuilder {
  final RepositoryScreenState repositoryScreenState;

  MarkdownHeadingBuilder({
    required this.repositoryScreenState,
  });

  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    final String textContent = text.textContent;
    final GlobalKey key = GlobalKey();
    repositoryScreenState.addHeaderToHeadersList(textContent, key);

    return Text(textContent, key: key, style: preferredStyle,);
  }
}
