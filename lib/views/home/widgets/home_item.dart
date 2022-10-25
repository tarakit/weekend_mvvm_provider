import 'package:flutter/material.dart';

import '../../../models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final Data article;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      title: Text('${article.attributes!.title}'),
      subtitle: Text('${article.attributes!.content}'),
    );
  }
}