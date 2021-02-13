import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:socialhack/data/data.dart';
import 'package:socialhack/models/request.dart';

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
                    child: new Column(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight:Radius.circular(16)),
                            child: Image.network(
                              requests[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          width: double.infinity,
                          height: 300,
                        ),
                        Text(
                          requests[index].title,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          requests[index].content,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: requests.length,
                itemWidth: MediaQuery.of(context).size.width - 24,
                itemHeight: MediaQuery.of(context).size.height - 200,
                layout: SwiperLayout.STACK,
              )
            : Text("Cargando"));
  }
}
