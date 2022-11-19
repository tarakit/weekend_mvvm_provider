import 'package:flutter/cupertino.dart';
import 'package:weekend_provider/data/response/api_response.dart';
import 'package:weekend_provider/models/article_response.dart';
import 'package:weekend_provider/models/image_reponse.dart';
import 'package:weekend_provider/repository/article_repository.dart';
import '../models/article.dart';

class ArticleViewModel extends ChangeNotifier{
  final _articleRepository = ArticleRepository();

  ApiResponse<ArticleModel> articleList = ApiResponse.loading();
  ApiResponse<ImageResponse> imageResponse = ApiResponse.loading();
  ApiResponse<ArticleResponse> articleResponse = ApiResponse.loading();

  setArticleResponse(ApiResponse<ArticleResponse> response){
    articleResponse = response;
    notifyListeners();
  }

  setImageResponse(ApiResponse<ImageResponse> response){
    imageResponse = response;
    notifyListeners();
  }
  
  setArticleList(ApiResponse<ArticleModel> response){
    articleList = response;
    notifyListeners();
  }

  Future<dynamic> postArticle(data, imageId) async{
    await _articleRepository.postArticle(data, imageId).then((value) {
      print('completed posting data');
      setArticleResponse(ApiResponse.complete(value));
    }).onError((error, stackTrace){
      print('failied posting data');
      setArticleList(ApiResponse.error(error.toString()));
    });
  }

  Future<dynamic> uploadImage(file) async {
    await _articleRepository.uploadImage(file).then((value) => {
      setImageResponse(ApiResponse.complete(value))
    }).onError((error, stackTrace) => {
      setImageResponse(ApiResponse.error(error.toString()))
    });
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