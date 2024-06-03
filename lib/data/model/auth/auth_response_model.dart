class AuthResponse {
  final String token;
  final String userEmail;
  final String userNicename;
  final String userDisplayName;

  AuthResponse({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      userEmail: json['user_email'],
      userNicename: json['user_nicename'],
      userDisplayName: json['user_display_name'],
    );
  }
}


// {
//     "token": "eyJ0eXAiOxxxxxxxxxxxxxxxxxxx1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwdGVzdC5kb2thbmRlbW8uY29tIiwiaWF0IjoxNzE3Mzk3NDk2LCJuYmYiOjE3MTczOTc0OTYsImV4cCI6MTcxODAwMjI5NiwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiNDE4In19fQ.pO9Ew2oaLRzRQZPEab2e7OwwCdZpUdKZnNkgFtlrb2Y",
//     "user_email": "testemail@gmail.com",
//     "user_nicename": "testusername",
//     "user_display_name": "testusername"
// }