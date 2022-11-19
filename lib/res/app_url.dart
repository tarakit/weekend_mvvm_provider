class AppUrl {
  static String baseUrl = "https://cms.istad.co/api";
  static String getArticles = '$baseUrl/articles?populate=thumbnail';

  static String getCategories = '$baseUrl/categories';
  static String uploadImage = '$baseUrl/upload';
  static String postArticle = '$baseUrl/articles';
}