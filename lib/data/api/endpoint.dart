class APIEndpoint {
  static const String baseAPIURl = "https://apptest.dokandemo.com/wp-json";
  static const String register = '$baseAPIURl/wp/v2/users/register';
  static const String login = '$baseAPIURl/jwt-auth/v1/token';

  static const String profile = '$baseAPIURl/wp/v2/users/me';
  static const String updateUser = '$baseAPIURl/wp/v2/users';
}
