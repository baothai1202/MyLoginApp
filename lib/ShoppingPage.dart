// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'Shoppingproduct.dart';

import 'ChoseColorWidget.dart';

class Shoppingpage extends StatefulWidget {
  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends State<Shoppingpage> {
  Handbags blueBag = Handbags(
    image: 'assets/images/bluebag.png',
    color: Color(0xFF88BBF0),
    size: '12cm',
    price: '\$234',
    id: 'blue',
  );
  Handbags yellowBag = Handbags(
      image: 'assets/images/yellowbag.png',
      color: Color(0xFFE3991C),
      size: '12cm',
      price: '\$342',
      id: 'yellow');

  Handbags grayBag = Handbags(
      image: 'assets/images/graybag.png',
      color: Color(0xFF838182),
      size: '12cm',
      price: '\$300',
      id: 'gray');
  late Handbags currentBag = yellowBag;
  int count = 0;
  bool addProduct = false;
  void update(String id) {
    setState(() {
      addProduct = false;
      count = 0;
      if (id == 'blue') {
        currentBag = blueBag;
      } else if (id == 'yellow') {
        currentBag = yellowBag;
      } else if (id == 'gray') {
        currentBag = grayBag;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
            color: currentBag.color,
            height: height,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon:
                                  Icon(Icons.arrow_back, color: Colors.white)),
                          Row(
                            spacing: 20,
                            children: [
                              Icon(Icons.search, color: Colors.white),
                              Stack(
                                children: [
                                  Icon(Icons.shopping_cart,
                                      color: Colors.white),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: addProduct ? Colors.red : null,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Text(
                              "Aristocratic Handbags",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                            Text(
                              "Office Code",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ))),
                Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                            Text(
                              currentBag.price,
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )
                          ],
                        ))),
                Expanded(flex: 6, child: SizedBox()),
              ],
            )),
        Container(
          child: Column(
            children: [
              Expanded(flex: 4, child: SizedBox()),
              Expanded(
                  flex: 6,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              " Colors",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ChoseColorWidget(
                                                  colorButtonRef: Colors.blue,
                                                  idRef: 'blue',
                                                  onUpdateRef: update,
                                                  currentBagidRef:
                                                      currentBag.id,
                                                ),
                                                ChoseColorWidget(
                                                  colorButtonRef: Colors.yellow,
                                                  idRef: 'yellow',
                                                  onUpdateRef: update,
                                                  currentBagidRef:
                                                      currentBag.id,
                                                ),
                                                ChoseColorWidget(
                                                  colorButtonRef: Colors.grey,
                                                  idRef: 'gray',
                                                  onUpdateRef: update,
                                                  currentBagidRef:
                                                      currentBag.id,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Size",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              currentBag.size,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ))),
                          Expanded(
                              flex: 2,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 20, top: 20, right: 20),
                                  child: Text(currentBag.description))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            spacing: 20,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (count != 0) count--;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
                                                    padding: EdgeInsets.all(10),
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 30,
                                                child: Text(
                                                  '$count',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  count++;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color:
                                                                Colors.black)),
                                                    padding: EdgeInsets.all(10),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    )),
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle),
                                              child: Icon(Icons.favorite,
                                                  color: Colors.white))),
                                    ],
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            addProduct = true;
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: currentBag.color),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Icon(
                                              Icons.add_shopping_cart,
                                              color: currentBag.color,
                                            )),
                                      ),
                                      GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 4,
                                                  vertical: 20),
                                              decoration: BoxDecoration(
                                                  color: currentBag.color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Text(
                                                'BUY NOW',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )))
                                    ],
                                  ))),
                        ],
                      ))),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Container(
              alignment: Alignment.centerRight,
              child: Expanded(
                  flex: 2, child: Image(image: AssetImage(currentBag.image))),
            ),
            Expanded(flex: 4, child: SizedBox())
          ],
        )
      ],
    )));
  }
}
