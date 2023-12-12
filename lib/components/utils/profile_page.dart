import 'package:copia_insta_tent1/components/utils/footer_bar.dart';
import 'package:copia_insta_tent1/components/utils/profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(child: Profile()),
            FooterBar(controller: listScrollController)
          ],
        ),
      ),
    );
  }
}
