import 'package:flutter/material.dart';
import 'model/car.dart';
import 'package:carousel_slider/carousel_slider.dart';

var currentCar = carList.cars[0];

class DesignTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: LayoutStarts(),
    );
  }
}

class LayoutStarts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[CarDetailsAnimation(), CustomBottomState()]);
  }
}

class CarDetailsAnimation extends StatefulWidget {
  @override
  _CarDetailsAnimationState createState() => _CarDetailsAnimationState();
}

class _CarDetailsAnimationState extends State<CarDetailsAnimation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30),
          child: _carTitle(),
        ),
        Container(
          width: double.infinity,
          child: CarCarousel(),
        )
      ],
    ));
  }

  _carTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
            text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 38),
                children: [
              TextSpan(text: currentCar.companyName),
              TextSpan(text: "\n"),
              TextSpan(
                  text: currentCar.carName,
                  style: TextStyle(fontWeight: FontWeight.w700))
            ])),
        SizedBox(height: 10),
        RichText(
            text: TextSpan(style: TextStyle(fontSize: 16), children: [
          TextSpan(
              text: currentCar.price.toString(),
              style: TextStyle(color: Colors.grey[50])),
          TextSpan(text: "/ day", style: TextStyle(color: Colors.grey[50]))
        ]))
      ],
    );
  }
}

class CarCarousel extends StatefulWidget {
  @override
  _CarCarouselState createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = currentCar.imgList;

  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
        child: Image.asset("assets/$assetName", fit: BoxFit.fitWidth));
  }).toList();

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: child,
          ),
          Container(
            margin: EdgeInsets.only(left: 55),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: _map<Widget>(imgList, (index, assetName) {
                return Container(
                  width: 50,
                  height: 2,
                  decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.grey[100]
                          : Colors.grey[600]),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomState extends StatefulWidget {
  @override
  _CustomBottomStateState createState() => _CustomBottomStateState();
}

class _CustomBottomStateState extends State<CustomBottomState> {
  double sheetTop = 400;
  double minSheetTop = 30;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sheetTop,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded ? sheetTop = 400 : sheetTop = minSheetTop;
            isExpanded = !isExpanded;
          });
        },
        child: SheetContainer(),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  const SheetContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 110;

    return Container(
      padding: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: Color(0xfff1f1f1f1)),
      child: Column(
        children: <Widget>[
          drawerHandler(),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                offerDetails(sheetItemHeight),
                // specifications(sheetItemHeight),
                // features(sheetItemHeight)
              ],
            ),
          )
        ],
      ),
    );
  }

  drawerHandler() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      height: 3,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xffd9dbdb)),
    );
  }

  offerDetails(double sheetItemHeight) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: <Widget>[
          Text(
            "offer Details",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              height: sheetItemHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentCar.offerDetails.length,
                  itemBuilder: (context, index) {
                    return ListItem(
                      sheetItemHeight: sheetItemHeight,
                      mapVal: currentCar.offerDetails[index],
                    );
                  }))
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final double sheetItemHeight;
  final Map mapVal;

  ListItem({required this.sheetItemHeight, required this.mapVal});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          mapVal.keys.elementAt(0),
          Text(
            mapVal.values.elementAt(0),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}
