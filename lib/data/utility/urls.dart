class Urls{
  static const String _baseUrl= 'https://ecommerce-api.codesilicon.com/api';
  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOtp(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
}
