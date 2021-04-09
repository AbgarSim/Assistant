import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/ioc_locator.dart';
import 'package:mobile/route_generator.dart';
import 'package:mobile/screens/start_page.dart';
import 'package:mobile/worker/db_sync_work_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DBSyncWorkManager.jobManager.init();

  //Get will init the db

  iocLocator();


  runApp(MaterialApp(
    title: 'Flutter App',
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''), // English, no country code
      const Locale('ru', ''), // Russian, no country code
    ],
    initialRoute: StartPage.routeName,
    onGenerateRoute: RouteGenerator.generatorRoutes,
  ));
}
