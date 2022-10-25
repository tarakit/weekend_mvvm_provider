import 'package:weekend_provider/data/network/network_api_service.dart';
import 'package:weekend_provider/res/app_url.dart';
import '../models/article.dart';

class ArticleRepository{
  final NetworkApiService _apiService = NetworkApiService();

  Future<ArticleModel> getArticle() async{
    try{
      var response = await _apiService.getAll(AppUrl.getArticles);
      // print('response in repository $response');
      return response = ArticleModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  // Future<CategoryModel> getCategory() async{
  //   try{
  //     var response = await _apiService.getAll(AppUrl.getCategories);
  //     return response = CategoryModel.fromJson(response);
  //   }catch(e){
  //     rethrow;
  //   }
  // }
}