import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty/di/di.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initLocator(
    () {},
  );

  runApp(MyApp(onSessionExpired: () {}));
}

class MyApp extends StatelessWidget {
  final void Function() onSessionExpired;

  const MyApp({super.key, required this.onSessionExpired});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
