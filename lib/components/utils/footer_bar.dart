// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FooterBar extends StatelessWidget {
  final controller;

  const FooterBar({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of(context, listen: false);
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () async {
                if (controller.hasClients) {
                  final position = controller.position.minScrollExtent;
                  controller.animateTo(
                    position,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linearToEaseOut,
                  );
                } else {
                  Navigator.of(context).pushNamed('/home');
                }
                await users.savePosts();
              },
              icon: const Icon(Icons.home_filled),
              iconSize: 40),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 40,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/newPost');
              },
              icon: const Icon(Icons.add_box),
              iconSize: 40),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
            icon: const Icon(Icons.person),
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
