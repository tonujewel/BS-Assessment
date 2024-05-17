class UrlManager {
  // Base url
  static const baseUrl = "https://api.github.com";

  // Product list
  static String searchUrl({required int perPage, required int page}) =>
      "$baseUrl/search/repositories?q=Flutter+language:dart&per_page=$perPage&sort=stars&page=$page";
}
