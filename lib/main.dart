import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_examples/SecondActivity.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: new ButtonDemo(),
  ));
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class ButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyApp();
  }
}

class MyApp extends State<ButtonDemo> {
  String btnText = "mobil fabrikatör";
  int countPRS = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        backgroundColor: Colors.brown,
      ),
      key: _scaffoldKey,
      body: SingleChildScrollView(
          child: new Container(
        child: new Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image:
                        'https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true',
                  )
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  new Text("Total:$btnText" + "  " + countPRS.toString()),
                  new RaisedButton(
                    child: const Text('Texti değiştir'),
                    color: Theme.of(context).accentColor,
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      btnText = "mobil fabrikatör butona bastı";
                      changeText();
                    },
                  ),
                ],
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 10.0),
              child: Column(
                children: <Widget>[
                  new CupertinoButton(
                    child: const Text("alert dialog göster (android tipi)"),
                    color: Colors.brown,
                    disabledColor: Colors.brown,
                    onPressed: () {
                      setState(() {
                        showDialogs();
                      });
                    },
                  ),
                  new Wrap(
                    spacing: 20.0,
                    // gap between adjacent chips
                    runSpacing: 4.0,
                    // gap between lines
                    direction: Axis.horizontal,
                    // main axis (rows or columns)
                    children: <Widget>[
                      new RaisedButton(
                        child: const Text("snackbar göster"),
                        color: Colors.deepOrangeAccent,
                        elevation: 0.0,
                        splashColor: Colors.white,
                        onPressed: () {
                          showInSnackBar("egemen");
                        },
                      ),
                      new RaisedButton(
                        child: const Text("alert dialog göster ios tipi"),
                        color: Colors.blueAccent,
                        elevation: 0.0,
                        splashColor: Colors.white,
                        onPressed: () {
                          showCupertinoDialog();
                        },
                      ),
                    ],
                  ),
                  new CupertinoButton(
                    child: const Text("login sayfasına git",
                        style: TextStyle(color: Colors.redAccent)),
                    color: Colors.yellowAccent,
                    disabledColor: Colors.yellow,
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void changeText() {
    setState(() {
      btnText = "butona bastı";
      countPRS++;
    });
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.deepOrange, content: new Text(value)));
  }

  void showDialogs() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showCupertinoDialog() {
    showDialog(
        context: context,
        // return object of type AlertDialog
        child: new CupertinoAlertDialog(
          title: new Column(
            children: <Widget>[
              new Text("CupertinoAlertDialog"),
              new Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ],
          ),
          content: new Text("An iOS-style alert dialog." +
              "An alert dialog informs the user about situations that require acknowledgement. An alert dialog has an optional title, optional content, and an optional list of actions. The title is displayed above the content and the actions are displayed below the content."),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("OK"))
          ],
        ));
  }
}
