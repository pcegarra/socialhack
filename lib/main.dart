import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:socialhack/models/request.dart';
import 'package:socialhack/pages/select_role_page.dart';
import 'data/data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SelectRolePage(),
    );
  }
}

class SwipePage extends StatefulWidget {
  SwipePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SwipePageState createState() => new _SwipePageState();
}

class _SwipePageState extends State<SwipePage> {
  List<Request> requests;

  @override
  void initState() {
    requests = generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: requests != null
            ? new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: new Column(
                      children: [
                        Text(requests[index].title),
                        Text(requests[index].content),
                      ],
                    ),
                  );
                },
                itemCount: requests.length,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height,
                layout: SwiperLayout.TINDER,
              )
            : Text("Cargando"));
  }
}
