class UrlManager {
  // Base url
  static const baseUrl = "https://api.github.com";

  // Product list
  static String searchUrl = "$baseUrl/search/repositories?q=Flutter+language:dart&per_page=10&sort=stars&page=1";
}
