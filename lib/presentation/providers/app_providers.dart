import 'package:copia_insta_tent1/presentation/providers/posts_provider.dart';
import 'package:copia_insta_tent1/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

mixin AppProviders {
  static var providers = [
    ChangeNotifierProvider(
      create: (_) => Users(),
    ),
    ChangeNotifierProvider(
      create: (_) => Posts(),
    ),
  ];
}
