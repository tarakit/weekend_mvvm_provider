import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekend_provider/models/article.dart';
import 'package:weekend_provider/view_model/article_view_model.dart';

import '../../data/response/status.dart';
import 'widgets/home_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ArticleViewModel articleViewModel = ArticleViewModel();

  @override
  void initState() {
    articleViewModel.fetchAllArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<ArticleViewModel>(
          create: (BuildContext context) =>  articleViewModel,
          child: Consumer<ArticleViewModel>(
            builder: (context, articleViewModel, _){
              print('status ${articleViewModel.articleList.status}');
              switch(articleViewModel.articleList.status){
                case Status.LOADING: return CircularProgressIndicator();
                case Status.COMPLETE:
                  var articles = articleViewModel.articleList.data?.data;
                  return ListView.builder(
                      itemCount: articles?.length,
                      itemBuilder: (context, index){
                        var article = articles![index];
                        return ArticleItem(article: article);
                });
                case Status.ERROR: return Text('Error');
                default: return const Text('defalut');
              }
            },
          ),
        ),
      ),
    );
  }
}


