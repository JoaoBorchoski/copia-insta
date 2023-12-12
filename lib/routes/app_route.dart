import 'package:copia_insta_tent1/components/utils/profile_page.dart';
import 'package:copia_insta_tent1/presentation/ui/camera/camera_page.dart';
import 'package:copia_insta_tent1/presentation/ui/home/home_page.dart';
import 'package:copia_insta_tent1/presentation/ui/login/login_page.dart';
import 'package:copia_insta_tent1/presentation/ui/newPost/new_post_page.dart';
import 'package:flutter/material.dart';

var appRoutes = <String, WidgetBuilder>{
  '/': (context) => const Login(),
  '/home': (context) => const HomePage(),
  '/camera': (context) => const CameraPage(),
  '/newPost': (context) => NewPostPage(),
  '/profile': (context) => const ProfilePage(),
};
