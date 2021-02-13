import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/app_state.dart';

class NormalUserLoggedPage extends StatefulWidget {
  @override
  _NormalUserLoggedPageState createState() => _NormalUserLoggedPageState();
}

class _NormalUserLoggedPageState extends State<NormalUserLoggedPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RaisedButton(
          child: Text(
            "Cerrar sesión",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            await logOut();
          })
    ]);
  }

  Future<void> logOut() async {
    var response = await Provider.of<AppState>(context, listen: false)
        .getCurrentUser()
        .logout();
    if (response.success) {
      await Provider.of<AppState>(context, listen: false).setCurrentUser(null);
    } else {
      print("error");
    }
  }
}
