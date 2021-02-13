import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/app_state.dart';
import 'package:socialhack/widgets/normal_user_logged_widget.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<AppState>().getCurrentUser() == null
        ? Container(
            color: Colors.grey.withAlpha(80),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: "Email"),
                          controller: emailController,
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Contraseña"),
                          obscureText: true,
                          controller: passwordController,
                        )),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        child: RaisedButton(
                            child: Text(
                              "Iniciar sesión",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              await loginUser();
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: NormalUserLoggedPage(),
          );
  }

  Future<void> loginUser() async {
    ParseUser user = ParseUser(
        emailController.text, passwordController.text, emailController.text);
    await user.login();
    checkCurrentUser();
  }

  Future<void> checkCurrentUser() async {
    ParseUser currentUser = await ParseUser.currentUser();
    if(currentUser!=null && currentUser.objectId!=null){
      print("hay user");
      Provider.of<AppState>(context, listen: false).setCurrentUser(currentUser);
    }
  }
}
