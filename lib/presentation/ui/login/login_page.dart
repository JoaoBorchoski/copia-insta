import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:copia_insta_tent1/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {
    'login': '',
    'password': '',
  };

  Widget get buildFormFieldEmail {
    return FutureBuilder(
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 14.0,
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (login) => _formData['login'] = login ?? '',
          ),
        );
      },
      future: null,
    );
  }

  Widget get buildFormFieldPassword {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: TextFormField(
        decoration: const InputDecoration(
          focusColor: AppColors.primary,
          border: OutlineInputBorder(),
          labelText: 'Senha',
        ),
        obscureText: true,
        onSaved: (password) => _formData['password'] = password!,
      ),
    );
  }

  Future<void> _submit(context) async {
    final isValid = _form.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _form.currentState?.save();
    Users users = Provider.of(context, listen: false);

    try {
      await users.login(
        _formData['login'] ?? '',
        _formData['password'] ?? '',
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Padding buildElevatedButton(context) => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.primary),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
            foregroundColor:
                MaterialStateProperty.all<Color>(AppColors.background),
          ),
          onPressed: (() async {
            await _submit(context);
          }),
          child: const SizedBox(
            width: double.infinity,
            child: Text(
              'Acessar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );

  Widget buildFilds(context) {
    return Form(
      key: _form,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      buildFormFieldEmail,
                      buildFormFieldPassword,
                      buildElevatedButton(context)
                    ]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.secondDegrade,
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: buildFilds(context),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }
}
