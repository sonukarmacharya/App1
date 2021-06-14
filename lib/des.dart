import 'package:flutter/material.dart';
import 'model/car.dart';

var currentCar = carList.cars[0];

class Des extends StatelessWidget {
  const Des({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Top(),
        Over(),
      ],
    );
  }
}

class Top extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My design')),
        body: Container(
          color: Colors.amber,
          height: 150,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                text: "Logo",
              )),
              RichText(
                  text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 15),
                text: "This is title",
              ))
            ],
          ),
        ));
  }
}

class Over extends StatefulWidget {
  @override
  _OverState createState() => _OverState();
}

class _OverState extends State<Over> {
  @override
  Widget build(BuildContext context) {
    print(carList.cars.length);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 150),
          decoration: BoxDecoration(
              color: Color(0xfff1f1f1f1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          padding: EdgeInsets.all(25),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: FlatButton(
                  textColor: Colors.red, // foreground
                  onPressed: () {},
                  child: Text('FlatButton with custom foreground/background'),
                ))
              ]),
        )
      ],
    );
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: 300,
    //   margin: EdgeInsets.only(top: 150),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
    //       color: Color(0xfff1f1f1f1),
    //     ),
    //     child: Column(
    //       children: <Widget>[Text("sdfb")],
    //     ),
    //   ),
    // );
  }
}
