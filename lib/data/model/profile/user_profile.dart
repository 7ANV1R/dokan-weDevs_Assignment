class UserProfile {
  final int id;
  final String userName;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  // for now we are not using these other fields

  UserProfile({
    required this.id,
    required this.userName,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      userName: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}

// {
//     "id": 418,
//     "username": "testusername",
//     "name": "testusername",
//     "first_name": "updated_first_name_test",
//     "last_name": "",
//     "email": "testemail@gmail.com",
//     "url": "",
//     "description": "",
//     "link": "https://apptest.dokandemo.com/author/testusername/",
//     "locale": "en_US",
//     "nickname": "testusername",
//     "slug": "testusername",
//     "roles": [
//         "subscriber"
//     ],
//     "registered_date": "2024-06-03T06:51:08+00:00",
//     "capabilities": {
//         "read": true,
//         "level_0": true,
//         "subscriber": true
//     },
//     "extra_capabilities": {
//         "subscriber": true
//     },
//     "avatar_urls": {
//         "24": "https://secure.gravatar.com/avatar/9cb14b499be76bb04fdbef92f29c744b?s=24&d=mm&r=g",
//         "48": "https://secure.gravatar.com/avatar/9cb14b499be76bb04fdbef92f29c744b?s=48&d=mm&r=g",
//         "96": "https://secure.gravatar.com/avatar/9cb14b499be76bb04fdbef92f29c744b?s=96&d=mm&r=g"
//     },
//     "meta": {
//         "persisted_preferences": []
//     },
//     "_links": {
//         "self": [
//             {
//                 "href": "https://apptest.dokandemo.com/wp-json/wp/v2/users/418"
//             }
//         ],
//         "collection": [
//             {
//                 "href": "https://apptest.dokandemo.com/wp-json/wp/v2/users"
//             }
//         ]
//     }
// }