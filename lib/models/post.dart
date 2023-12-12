class UserPost {
  final String name;
  final String avatar;
  final String email;
  final int id;
  final String password;

  UserPost({
    required this.name,
    required this.avatar,
    required this.email,
    required this.id,
    required this.password,
  });
}

class PostUser {
  final String imageURL;
  final UserPost user;
  final String description;
  final String createdt;

  const PostUser({
    required this.imageURL,
    required this.user,
    required this.description,
    required this.createdt,
  });
}
