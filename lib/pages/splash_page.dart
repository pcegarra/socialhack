import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/pages/select_role_page.dart';

import '../app_state.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var isParseInitialized = false;

  @override
  void initState() {
    super.initState();
    initParse();
  }

  @override
  Widget build(BuildContext context) {
    return !isParseInitialized
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SelectRolePage();
  }

  Future<void> initParse() async {
    await Parse().initialize(
      "efK71cod9vSrKBwa9LQ06T351opxke",
      "https://socialhack.costaoeste.es/1/",
    );

    await checkCurrentUser();

    setState(() {
      isParseInitialized = true;
    });
  }

  Future<void> checkCurrentUser() async {
    ParseUser currentUser = await ParseUser.currentUser();
    if (currentUser != null && currentUser.objectId != null) {
      Provider.of<AppState>(context, listen: false).setCurrentUser(currentUser);
    }
  }
}
