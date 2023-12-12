import 'package:copia_insta_tent1/data/repositories/store.dart';
import 'package:copia_insta_tent1/models/post.dart';
import 'package:flutter/material.dart';

class Posts with ChangeNotifier {
  carregaPost() async {
    var posts = await Store.getMap('posts');
    return posts['posts'];
  }

  Future<PostUser> byIndex(int i) async {
    return await carregaPost().values.elementAt(i);
  }

  Future<int> get count async {
    return await carregaPost().length;
  }

  // final Map<String, PostUser> _items = {...POSTS};

  // ignore: unused_field

  // List<PostUser> get all {
  //   return [..._items.values];
  // }

  // int get count {
  //   return _items.length;
  // }

  // PostUser byIndex(int i) {
  //   return _items.values.elementAt(i);
  // }

  // void put(PostUser user) {
  //   // ignore: unnecessary_null_comparison
  //   if (user == null) {
  //     return;
  //   }

  //   // newUser or updateUser

  //   final id = Random().nextDouble().toString();
  //   _items.putIfAbsent(
  //     id,
  //     () => PostUser(
  //         imageURL: user.imageURL,
  //         description: user.description,
  //         userName: 'Joao Borchoski',
  //         userAvatar:
  //             'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_1280.png'),
  //   );
  //   notifyListeners();
  // }
}
