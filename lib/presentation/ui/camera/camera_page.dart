import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: const Center(
            child: Text(
          'Sua foto aqui coisa feia',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        )),
      ),
    );
  }
}
