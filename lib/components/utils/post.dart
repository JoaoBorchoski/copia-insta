// ignore_for_file: unrelated_type_equality_checks

import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:copia_insta_tent1/models/post.dart';

class Post extends StatefulWidget {
  final PostUser? post;
  final String? userId;

  const Post({
    Key? key,
    this.userId,
    this.post,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  Widget projectedWidget() {
    if (widget.userId == widget.post?.user.id.toString()) {
      return const Text('oi');
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatar = widget.post!.user.avatar.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(widget.post!.user.avatar));

    final img = widget.post!.imageURL.isEmpty
        ? 'https://sitechecker.pro/wp-content/uploads/2023/06/404-status-code.png'
        : widget.post!.imageURL;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.body.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  avatar,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        child: Text(
                          widget.post!.user.name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      projectedWidget()
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    '${widget.post!.user.name}:  ',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    widget.post!.description,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
