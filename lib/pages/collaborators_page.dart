import 'package:flutter/material.dart';

class CollaboratorsPage extends StatefulWidget {
  @override
  _CollaboratorsPageState createState() => _CollaboratorsPageState();
}

class _CollaboratorsPageState extends State<CollaboratorsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext ctxt, int index) =>
              buildBody(ctxt, index)),
    );
  }

  // A Separate Function called from itemBuilder
  Widget buildBody(BuildContext ctxt, int index) {
    return new Text("Test");
  }
}
