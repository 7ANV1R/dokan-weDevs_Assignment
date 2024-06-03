class AuthEndpoint {
  static const String baseAPIURl = "https://apptest.dokandemo.com/wp-json";
  static const String register = '$baseAPIURl/wp/v2/users/register';
  static const String login = '$baseAPIURl/jwt-auth/v1/token';
}
