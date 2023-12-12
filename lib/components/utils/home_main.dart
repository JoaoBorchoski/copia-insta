// ignore_for_file: prefer_const_constructors
import 'package:copia_insta_tent1/components/utils/footer_bar.dart';
import 'package:copia_insta_tent1/components/utils/posts.dart';
import 'package:copia_insta_tent1/components/utils/storys.dart';
import 'package:flutter/material.dart';

class MainMenuBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  const MainMenuBody({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    //Users users = Provider.of(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Storys(),
          Expanded(
              child: PostsHome(
            controller: controller,
          )),
          FooterBar(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
