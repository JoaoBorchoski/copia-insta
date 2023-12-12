import 'package:copia_insta_tent1/components/utils/story.dart';
import 'package:copia_insta_tent1/data/store.dart';
import 'package:copia_insta_tent1/models/user.dart';
import 'package:flutter/material.dart';
import 'package:copia_insta_tent1/shared/themes/app_colors.dart';

class Storys extends StatelessWidget {
  carregaUsers() async {
    var users = await Store.getMap('users');
    return users['users'];
  }

  const Storys({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: carregaUsers(),
      builder: (context, snapshot) {
        List variavel = (snapshot.data ?? []) as List;
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.body.withOpacity(0.5),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: variavel.length,
              itemBuilder: (context, index) {
                var usar = User(
                    name: variavel[index]['name'],
                    email: variavel[index]['email'],
                    avatar: variavel[index]['avatar']);
                return StoryHeader(usar);
              },
            ));
      },
    );
  }
}
