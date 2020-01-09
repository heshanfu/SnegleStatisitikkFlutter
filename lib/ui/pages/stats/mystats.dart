import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slugflutter/database/controllers/localDBcontroller.dart';
import 'package:slugflutter/database/models/user_model.dart';
import 'package:slugflutter/ui/themes/theme.dart';
import 'package:slugflutter/widgets/round_cancel_button.dart';

class MyStats extends StatefulWidget {

  @override
  _MyStatsState createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {

  static int _lastFind;
  static int _averageFind;
  static String _dateMostFound;
  static int _maxFind;

  @override
  Widget build(BuildContext context) {

    // Get all local data

    return FutureBuilder(
      future: LocalDBController.getAllSimpleUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var user = snapshot.data;
          _lastFind = user['lastFind'];

          _maxFind = user['maxFind'];
          print('Data Loaded');
          return _myStats(user);
        }
        print('Loading...');
        return CircularProgressIndicator(
          backgroundColor: Colors.cyan,
          strokeWidth: 5,
        );
      },
    );
  }

  Widget _myStats(var user) {
    return Scaffold(
      backgroundColor: CustomTheme.getTheme.backgroundColor,
      body: Center(  
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Min statistikk',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: Divider(
                color: CustomTheme.getTheme.textSelectionColor,
              ),
            ),
            Text("Forrige fangst",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text('$_lastFind',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
            ),
            Text("Snitt fangst",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text("34",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
            ),
            Text("Dato flest fanget",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text("12.02.2019",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
            ),
            Text("Max fangst",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: CustomTheme.getTheme.textSelectionColor,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text('$_maxFind',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: CustomTheme.getTheme.textSelectionColor,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton:  CancelButton()
    );
  }
}