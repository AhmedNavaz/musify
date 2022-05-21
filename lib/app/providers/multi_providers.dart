import 'package:flutter/material.dart';
import 'package:musify/core/notifier/auth_provider.notifier.dart';
import 'package:provider/provider.dart';

import '../../core/notifier/connection.notifier.dart';

class MultiProviders extends StatelessWidget {
  const MultiProviders(this.child, {Key? key}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConnectionNotifier>(
          create: (BuildContext context) => ConnectionNotifier(),
        ),
        ChangeNotifierProvider<AuthProviderNotifier>(
          create: (BuildContext context) => AuthProviderNotifier(),
        ),
      ],
      child: child,
    );
  }
}
