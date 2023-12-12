import 'package:copia_insta_tent1/data/repositories/store.dart';

class UserData {
  String? token;
  String? name;
  String? email;
  String? id;
  String? avatar;

  UserData({
    this.token,
    this.name,
    this.email,
    this.id,
    this.avatar,
  });

  Object? get values => null;
}

Future<UserData> loadUserData() async {
  Map userData = await Store.getMap('userData');

  return UserData(
    token: userData['token'],
    name: userData['name'],
    email: userData['email'],
    id: userData['id'],
    avatar: userData['avatar'],
  );
}
