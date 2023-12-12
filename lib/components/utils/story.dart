import 'package:copia_insta_tent1/models/user.dart';
import 'package:flutter/material.dart';

class StoryHeader extends StatelessWidget {
  final User? story;

  const StoryHeader(
    this.story, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = story!.avatar.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(backgroundImage: NetworkImage(story!.avatar));
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: avatar,
    );
  }
}
