import 'package:flutter/cupertino.dart';
import 'package:weekend_provider/data/response/api_response.dart';
import 'package:weekend_provider/repository/article_repository.dart';
import '../models/article.dart';

class ArticleViewModel extends ChangeNotifier{
  final _articleRepository = ArticleRepository();

  ApiResponse<ArticleModel> articleList = ApiResponse.loading();

  setArticleList(ApiResponse<ArticleModel> response){
    articleList = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllArticles() async{
    await _articleRepository.getArticle().then((value) {
        print('success');
        setArticleList(ApiResponse.complete(value));
    }).onError((error, stackTrace) {
        setArticleList(ApiResponse.error(error.toString()));
    });
  }
}