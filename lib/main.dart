import 'package:flutter/material.dart';
import 'package:flutter_default_project/l10n/l10n.dart';
import 'package:flutter_default_project/settings/routes/app_router.dart';
import 'package:flutter_default_project/utils/global/default_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

import 'services/secure_storage_service.dart';
import 'settings/injection.dart';
import 'utils/methods/show_snack_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.dev);
  getIt<SecureStorageService>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      theme: DefaultTheme.theme,
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      scaffoldMessengerKey: snackbarKey,
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
