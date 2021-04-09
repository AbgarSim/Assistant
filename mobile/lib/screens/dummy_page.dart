import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ioc/ioc.dart';
import 'package:mobile/application/dummy_dao_service.dart';
import 'package:mobile/model/dummy.dart';
import 'package:mobile/widgets/nav_drawer.dart';

class DummyPage extends StatefulWidget {
  static const String routeName = '/dummy';

  @override
  State<StatefulWidget> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  Future<List<Dummy>> _futureDummyList;

  DummyDaoService dummyDaoService;

  @override
  void initState() {
    super.initState();
    dummyDaoService = Ioc().use<DummyDaoService>(DummyDaoService);
    _futureDummyList = dummyDaoService.fetchDummyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(AppLocalizations.of(context).dummyScreenAppBar)),
      drawer: NavDrawer(),
      body: FutureBuilder<List<Dummy>>(
        future: _futureDummyList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10,
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.album, size: 70),
                            title: Text(
                                AppLocalizations.of(context).dummyCardTextNum +
                                    '${snapshot.data[index].num}'),
                            subtitle: Text(
                                AppLocalizations.of(context).dummyCardTextID +
                                    '${snapshot.data[index].id}'),
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                child: Text(
                                    AppLocalizations.of(context).increment),
                                onPressed: () =>
                                    {_incrementWidget(snapshot.data[index])},
                              ),
                              ElevatedButton(
                                  child:
                                      Text(AppLocalizations.of(context).update),
                                  onPressed: () => {
                                        _showUpdateAlertDialog(
                                            context, snapshot.data[index])
                                      })
                            ],
                          )
                        ],
                      ),
                    ));
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showCreateAlertDialog(context)),
    );
  }

  _incrementWidget(Dummy dummy) {
    setState(() {
      dummy.num += 1;
    });
  }

  //TODO figure out how to do this reactively
  _showCreateAlertDialog(BuildContext context) {
    Dummy dummyToCreate = Dummy(id: null, num: 21);
    AlertDialog alertDialog = AlertDialog(
      title: Text(AppLocalizations.of(context).dummySaveTitle),
      content: Text(AppLocalizations.of(context).dummySaveContent),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context).no),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context).yes),
          onPressed: () {
            dummyDaoService.createDummy(dummyToCreate);
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
      barrierDismissible: false,
    );
  }

  _showUpdateAlertDialog(BuildContext context, Dummy dummyToUpdate) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(AppLocalizations.of(context).dummyUpdateTitle),
      content: Text(AppLocalizations.of(context).dummyUpdateContent),
      actions: [
        TextButton(
          child: Text(AppLocalizations.of(context).no),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(AppLocalizations.of(context).yes),
          onPressed: () {
            dummyDaoService.updateDummy(dummyToUpdate);
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
      barrierDismissible: false,
    );
  }
}
