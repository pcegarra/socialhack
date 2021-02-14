import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/data/data.dart';
import 'package:socialhack/models/request.dart';

import '../app_state.dart';

class SwipePage extends StatefulWidget {
  @override
  _SwipePageState createState() => _SwipePageState();
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
    requests = requests
        .where((element) =>
    element.interest.id == context
        .watch<AppState>()
        .currentCategory)
        .toList();

    if (requests == null || requests.isEmpty) {
      return Container(
        child: Center(
          child: Text("Ups no hemos encontrado nada para esta categoría"),
        ),
      );
    }

    return new Scaffold(
        body: requests != null
            ? new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
              child: SingleChildScrollView(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: Image.network(
                          requests[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        requests[index].title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        requests[index].content,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Entidad: " + requests[index].collaborator,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: ButtonTheme(
                        minWidth: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 50,
                        child: RaisedButton(
                          onPressed: () {
                            _launchURL(requests[index].url);
                          },
                          child: Text(
                            requests[index].interest.textButtonAction,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: requests.length,
          itemWidth: MediaQuery
              .of(context)
              .size
              .width - 24,
          itemHeight: MediaQuery
              .of(context)
              .size
              .height - 200,
          layout: SwiperLayout.STACK,
        )
            : Text("Cargando"));
  }

  _launchURL(String url) async {
    /*if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/
  }
}
