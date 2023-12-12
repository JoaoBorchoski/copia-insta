// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  NewPostPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of(context, listen: false);
    _submit() async {
      final isValid = _form.currentState?.validate();

      if (isValid!) {
        _form.currentState?.save();

        await users.newPost(_formData['imageURL']!, _formData['description']!);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo post'),
        backgroundColor: AppColors.primary,
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                final isValid = _form.currentState?.validate();

                if (isValid!) {
                  _form.currentState?.save();

                  await _submit();

                  Navigator.of(context).pushNamed('/home');
                }
              },
              icon: const Icon(
                Icons.save,
              ),
              iconSize: 35)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    onSaved: (newValue) => _formData['description'] = newValue!,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'URL da imagem'),
                    onSaved: (newValue) => _formData['imageURL'] = newValue!,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        final isValid = _form.currentState?.validate();

                        if (isValid!) {
                          _form.currentState?.save();

                          await _submit();

                          Navigator.of(context).pushNamed('/home');
                        }
                      },
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
