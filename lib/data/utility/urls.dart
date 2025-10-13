class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String getCategorySliders = '$_baseUrl/CategoryList';

  static String getProductsByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String getProductByRemark(String remarks) =>
      '$_baseUrl/ListProductByRemark/$remarks';

  static String getProductDetailsById(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String cartList = '$_baseUrl/CartList';
}
