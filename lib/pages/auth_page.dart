import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/app_state.dart';
import 'package:socialhack/widgets/normal_user_logged_widget.dart';
import 'package:socialhack/widgets/ong_user_logged_widget.dart';

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
        ? SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(1, 3), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 150, child: Image.asset("assets/login.png")),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email"),
                            controller: emailController,
                          )),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Contraseña"),
                        obscureText: true,
                        controller: passwordController,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
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
            ),
          )
        : Center(
            child: context.watch<AppState>().isOng()
                ? OngUserLoggedPage()
                : NormalUserLoggedPage(),
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
    if (currentUser != null && currentUser.objectId != null) {
      Provider.of<AppState>(context, listen: false).setCurrentUser(currentUser);
    }
  }
}
