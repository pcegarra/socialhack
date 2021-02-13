import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:socialhack/pages/home_page.dart';

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
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : HomePage();
  }

  Future<void> initParse() async {

    await Parse().initialize("efK71cod9vSrKBwa9LQ06T351opxke", "https://socialhack.costaoeste.es/1/",);

    setState(() {
      isParseInitialized = true;
    });
  }
}
