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
      leading:  article.attributes!.thumbnail!.thumbnaildata == null ?
          Image.network('https://www.contentviewspro.com/wp-content/uploads/2017/07/default_image.png') :
      Image.network('https://cms.istad.co${article.attributes!.thumbnail!.thumbnaildata!.thumbnailattributes!.url}'),
    );
  }
}