import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/api/dummy_http.dart';
import 'package:mobile/model/dummy.dart';

class DummyInfoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DummyInfoList();
}

class _DummyInfoList extends State<DummyInfoList> {
  Future<List<Dummy>> _futureDummyList;

  @override
  void initState() {
    super.initState();
    _futureDummyList = fetchDummyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sla;fmlkasjflkajf"),
      ),
      body: FutureBuilder<List<Dummy>>(
        future: _futureDummyList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      Text('Dummy num: ${snapshot.data[index].num}'),
                      Row(
                        children: [
                          TextButton(
                            child: Text("Increment"),
                            onPressed: () =>
                                {_incrementWidget(snapshot.data[index])},
                          ),
                          TextButton(
                            child: Text("Update"),
                            onPressed: () => {
                              _showUpdateAlertDialog(
                                  context, snapshot.data[index])
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
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
      title: Text("Save dummy"),
      content: Text("Save dummy to Server?"),
      actions: [
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            createDummy(dummyToCreate);
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
      title: Text("Update dummy"),
      content: Text("Save dummy to Server"),
      actions: [
        TextButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            updateDummy(dummyToUpdate);
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
