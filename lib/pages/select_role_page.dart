import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:socialhack/data/data.dart';
import 'package:socialhack/models/interest.dart';
import 'package:socialhack/pages/home_page.dart';

class SelectRolePage extends StatefulWidget {
  @override
  _SelectRolePageState createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  List<Interest> interests;

  @override
  void initState() {
    interests = generateDataInterests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bienvenid@ a Social Finder",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "Es tu primera vez, ¿verdad? A continuación puedes elegir varias temáticas para personalizar tu experiencia y poder mostrarte mejor contenido donde puedas contribuir tu granito o tu camión de arena",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Tags(
              key: _tagStateKey,
              itemCount: interests.length,
              itemBuilder: (int index) {
                return ItemTags(
                  // Each ItemTags must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(index.toString()),
                  index: index,
                  // required
                  title: interests[index].title,
                  active: false,
                  activeColor: Colors.greenAccent,
                  textActiveColor: Colors.black,
                  color: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  combine: ItemTagsCombine.withTextBefore,
                  icon: ItemTagsIcon(
                    icon: Icons.check,
                  ),
                  // OR null,
                  onPressed: (item) => print(item),
                  onLongPressed: (item) => print(item),
                );
              },
            ),
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                "Continuar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ));
  }

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

// Allows you to get a list of all the ItemTags
  _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null)
      lst.where((a) => a.active == true).forEach((a) => print(a.title));
  }
}
