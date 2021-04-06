import 'package:flutter/material.dart';
import 'package:mobile/widgets/nav_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartPage extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context).startScreenAppBar)),
      drawer: NavDrawer(),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context).startScreenContent,
              style: TextStyle(fontSize: 50))
        ],
      )),
    );
  }
}
