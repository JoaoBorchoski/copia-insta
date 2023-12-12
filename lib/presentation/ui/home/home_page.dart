// ignore_for_file: avoid_print

import 'package:copia_insta_tent1/components/utils/home_main.dart';
import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController listScrollController = ScrollController();

  Future modalMessage(ctx) {
    return showDialog(
        context: ctx,
        builder: (context) => AlertDialog(
              title: const Text('Mensagens? Você é sozinho irmão'),
              content: const Text('Concorda?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    modalPara(ctx);
                  },
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Sim'),
                ),
              ],
            ));
  }

  Future modalPara(ctx) {
    return showDialog(
        context: ctx,
        builder: (context) => AlertDialog(
              title: const Text('Para de se enganar...'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Tá, chega disso'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              // ignore: dead_code
              true ? const BackButton(color: AppColors.background) : null,
          title: const Center(child: Text('Instagram')),
          actions: [
            IconButton(
                onPressed: () {
                  modalMessage(context);
                },
                icon: const Icon(Icons.message))
          ],
          backgroundColor: AppColors.primary,
        ),
        body: MainMenuBody(
          controller: listScrollController,
        ));
  }
}
