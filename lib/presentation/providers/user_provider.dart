// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:copia_insta_tent1/components/utils/load_user_data.dart';
import 'package:copia_insta_tent1/data/repositories/store.dart';
import 'package:copia_insta_tent1/shared/themes/config/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  String? token;
  String? name;
  String? email;
  String? id;
  String? avatar;

  Future getUser() async {
    Map userData = await Store.getMap('userData');

    return userData;
  }

  void logout() {
    Store.remove('userData').then((_) {
      notifyListeners();
    });
  }

  carregaPost() async {
    var posts = await Store.getMap('posts');
    notifyListeners();
    return posts['posts'];
  }

  Future<String> login(String login, String password) async {
    final response = await _authenticate(login, password, 'signInWithPassword');

    await savePosts();
    await getUsers();
    return response;
  }

  Future<void> newPost(image, description) async {
    final user = await loadUserData();
    final url = '${AppConstants.apiUrl}/posts/${user.id}';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'imageURL': image,
        'description': description,
      }),
    );

    final body = jsonDecode(response.body);

    await savePosts();
    await carregaPost();

    notifyListeners();

    return body ?? '';
  }

  Future<void> getUsers() async {
    const url = '${AppConstants.apiUrl}/users';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final body = jsonDecode(response.body);

    Store.saveMap('users', {'users': body});
  }

  Future<void> savePosts() async {
    const url = '${AppConstants.apiUrl}/posts';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final body = jsonDecode(response.body);

    notifyListeners();

    Store.saveMap('posts', {'posts': body});
  }

  Future<String> _authenticate(
    String login,
    String password,
    String urlFragment,
  ) async {
    const url = '${AppConstants.apiUrl}/login';

    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': login,
        'password': password,
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print(body['message']);
    } else {
      token = body['token'];
      name = body['user']['name'];
      email = body['user']['email'];
      id = body['user']['id'].toString();
      avatar = body['user']['avatar'];

      Store.saveMap('userData', {
        'token': token,
        'name': name,
        'email': email,
        'id': id,
        'avatar': avatar
      });

      notifyListeners();
    }

    return token ?? '';
  }
}
