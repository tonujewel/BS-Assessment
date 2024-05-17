class UrlManager {
  // Base url
  static const baseUrl = "https://api.github.com/";

  // Product list
  static String productListUrl = "$baseUrl/public/new-arrival/products";
  static String searchUrl = "$baseUrl/search/repositories?q=Flutter&per_page=10&sort=stars";
}
