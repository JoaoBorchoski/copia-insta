// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:copia_insta_tent1/components/utils/load_user_data.dart';
import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id = '';
  String name = '';
  String email = '';
  String avatar =
      'https://media.istockphoto.com/id/1300845620/pt/vetorial/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=2048x2048&w=is&k=20&c=WAnDMS5oCNIj7VFSrf_Y0_fRWD9QlrG-1Gzr1joCnaM=';
  List _cards = [];

  @override
  void initState() {
    super.initState();
    _cards = [];
    _carregaUser();
    _fetchData();
  }

  Future<void> _fetchData() async {
    List postList = [];
    await Provider.of<Users>(context, listen: false)
        .carregaPost()
        .then((value) {
      postList = value;
      setState(() {
        _cards.addAll(postList
            .where((post) => post['user']['id'].toString() == id)
            .toList());
      });
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> _carregaUser() async {
    UserData userData = await loadUserData();
    id = userData.id ?? '';
    name = userData.name ?? '';
    email = userData.email ?? '';
    avatar = userData.avatar ?? '';
  }

  Widget ProfileHeader(context, image, name, email, Users users) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width / 2.5,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 70,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(email)
              ],
            )
          ],
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Sair do Instagram'),
                        content: const Text('Tem certeza?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Não'),
                          ),
                          TextButton(
                            onPressed: () => {
                              users.logout(),
                              Navigator.of(context).pushNamed('/')
                            },
                            child: const Text('Sim'),
                          ),
                        ],
                      ));
            },
            icon: const Icon(Icons.logout))
      ],
    );
  }

  Widget BorderBottom() {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.black,
        width: 1,
      ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          ProfileHeader(context, avatar, name, email, users),
          BorderBottom(),
          FutureBuilder(
              future: users.carregaPost(),
              builder: ((context, snapshot) {
                var dataUser = (snapshot.data ?? []) as List;
                //var postsFinal = [];

                final postsFinal = dataUser
                    .where((post) => post['user']['id'].toString() == id)
                    .toList();

                return Expanded(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.start,
                    children: [
                      for (var post in postsFinal)
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.27,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              post['imageURL'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }))
        ],
      ),
    );
  }
}
