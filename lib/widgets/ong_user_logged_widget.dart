import 'package:flutter/material.dart';

class OngUserLoggedPage extends StatefulWidget {
  @override
  _NormalUserLoggedPageState createState() => _NormalUserLoggedPageState();
}

class _NormalUserLoggedPageState extends State<OngUserLoggedPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                Container(height: 150, child: Image.asset("assets/add_content.png")),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Título"),
                      controller: titleController,
                    )),
                TextField(
                  maxLines: 10,
                  minLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Descripción"),
                  controller: contentController,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                        child: Text(
                          "Añadir petición",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {}),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
