import 'dart:io';
import 'package:flutter/material.dart';
import 'package:socialhack/data/data.dart';

class OngUserLoggedPage extends StatefulWidget {
  @override
  _NormalUserLoggedPageState createState() => _NormalUserLoggedPageState();
}

class _NormalUserLoggedPageState extends State<OngUserLoggedPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController webController = TextEditingController();

  File _image;
  String actionSelected;

  Future getImage() async {

  }

  onChangeAction(String action) {
    setState(() {
      actionSelected = action;
    });
  }

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
                Container(
                    height: 150, child: Image.asset("assets/add_content.png")),
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
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Dirección web"),
                      controller: webController,
                    )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 50,
                      child: DropdownButtonFormField<String>(
                          items: [
                            ...generateDataInterests().map((interest) =>
                                DropdownMenuItem(
                                    value: interest.title,
                                    child: Text(interest.title)))
                          ],
                          value: actionSelected,
                          onChanged: onChangeAction,
                          hint: Text("Tipo de ayuda"),
                          itemHeight: 50),
                    )),
                ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: getImage,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Seleccionar imagen de la galería',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: _image == null
                          ? Text('Sin imagen seleccionada')
                          : Image.file(
                              _image,
                              width: 200,
                              height: 200,
                            ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 32, bottom: 16),
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
