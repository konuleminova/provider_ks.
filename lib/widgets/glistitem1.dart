import 'package:flutter/material.dart';
import 'package:flutter_kendden_shehere/model/product_model.dart';

import 'gtile_title.dart';

class GroceryListItemOne extends StatefulWidget {
  Product product;

  GroceryListItemOne({this.product});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GroceryListItemOneState();
  }
}

class GroceryListItemOneState extends State<GroceryListItemOne>
    with SingleTickerProviderStateMixin {
  String title;
  Product product;
  AnimationController animationController;
  Animation animation;
  int currentState = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    animation = Tween(begin: 28, end: 32.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    product = widget.product;
    String langCode = Localizations.localeOf(context).languageCode;
    if (langCode == "tr") {
      title = product.name_az.trim();
    } else if (langCode == "en") {
      title = product.name_en.trim();
    } else if (langCode == "ru") {
      title = product.name_ru.trim();
    }
    int weight = product.weight;
    // TODO: implement build
    return product != null
        ? Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: !product.isAdded
                        ? Colors.grey[300]
                        : Colors.green[300]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade200,
                      spreadRadius: 2.0)
                ]),
            margin: EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                              child: FadeInImage.assetNetwork(
                                image:
                                    "https://kenddenshehere.az/images/pr/th/" +
                                        product.code +
                                        ".jpg",
                                placeholder: "images/noimage.png",
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                              height: 150,
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 4)),
                          onTap: () {

                          },
                        ),
                        new GroceryTitle(text: title),
                        new Container(
                            height: 20,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                   // new RatingStarWidget(1, 1, 16),
                                    new Container(
                                      child: Text("4.2"),
                                    ),
                                  ],
                                ),
                                new InkWell(
                                    focusColor: Colors.green,
                                    highlightColor: Colors.green,
                                    hoverColor: Colors.green,
                                    child: IconButton(
                                      icon: Icon(
                                        product.isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.pink[400],
                                        size: double.parse(
                                            animation.value.toString()),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          product.isLiked = !product.isLiked;
                                          animationController.forward();
                                        });
                                      },
                                    )),
                              ],
                            )),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new GrocerySubtitle(text: product.counttype),
                            new GrocerySubtitle(text: product.price + " AZN"),
                          ],
                        ),
                        addedWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  addedWidget() {
    int weight = product.weight;
    return AnimatedCrossFade(
      firstChild: Container(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.green,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  product.isAdded = !product.isAdded;
                });
              })),
      secondChild: new Container(
        height: 35,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        alignment: Alignment.topRight,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.remove),
              iconSize: 20,
              onPressed: () {
                setState(() {
                  // product.isAdded = !product.isAdded;
                  if (product.weight > 1) {
                    product.weight--;
                  }
                });
              },
            ),
            new Text(
              product.weight.toString(),
              style: new TextStyle(fontSize: 18),
            ),
            new IconButton(
              iconSize: 20,
              padding: EdgeInsets.all(4),
              icon: new Icon(Icons.add),
              onPressed: () {
                weight++;
                setState(() {
                  product.weight++;
                });
              },
            ),
          ],
        ),
      ),
      crossFadeState: !product.isAdded
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 300),
      firstCurve: Curves.easeInToLinear,
      secondCurve: Curves.easeOutQuad,
    );
  }
}
