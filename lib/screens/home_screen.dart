import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/screens/second_screen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_cart/services/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var image;

  var imageUrl;

  int numberOfQuantity = 0;

  Future getDetails() async {
    http.Response response = await http.get(
      'https://mini.ilmtechnosolutions.com/api/v1/products/desc',
    );

    // the code below is for debugging purpose
    // print(response.body);

    // storing the data in a variable
    var data = jsonDecode(response.body);

    imageUrl = data['data'][0]['images'][0]['image'];
    // image = imageUrl;
    // print(imageUrl);

    // return imageUrl;
    return data;
  }

  void printData() async {
    image = await getDetails();

    print(image['data'][0]['images'][0]['image']);
  }

  @override
  void initState() {
    super.initState();

    // print(image);

    // printData();

    // getDetails();
  }

  @override
  Widget build(BuildContext context) {
    // print(image['data'][0]['images'][0]['image']);
    // image['data'][0]['images'][0]['image']
    // print(imageUrl);
    // printData();
    // print(image);
    // print(image['data'][0]['images'][0]['image']);
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '''Delivery Location
Unnamed Road, Sector 16B, Greater Noida''',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 15.0,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.white,
                        // size: 15.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        height: 50.0,
                        width: 90.0,
                        // color: Colors.white,
                        child: Center(
                          child: Text(
                            'Categories',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        // color: Colors.white,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.search,
                              ),
                              onPressed: null,
                            ),
                            SizedBox(
                              width: 1.0,
                            ),
                            Text(
                              'Search for products',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              width: 90.0,
                            ),
                            Icon(
                              Icons.mic,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          left: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'North India Diwali Essentials',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        ReusableCardShownToUser(
                          firstImage: image['data'][0]['images'][0]['image'],
                          secondImage: image['data'][0]['images'][1]['image'],
                          thirdImage: image['data'][0]['images'][2]['image'],
                          fourthImage: image['data'][0]['images'][3]['image'],
                          imageSource: image['data'][0]['images'][0]['image'],
                          price: 'Rs${image['data'][0]['price']}',
                          mrp: 'Rs${image['data'][0]['mrp']}',
                          nameOfQuantity: '${image['data'][0]['name']}',
                          quantity: '${image['data'][0]['qty']}',
                          button: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      numberOfQuantity--;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    numberOfQuantity.toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // addingItem();
                                      numberOfQuantity++;
                                      print(numberOfQuantity);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ReusableCardShownToUser(
                          firstImage: image['data'][1]['images'][0]['image'],
                          secondImage: image['data'][1]['images'][1]['image'],
                          thirdImage: image['data'][1]['images'][2]['image'],
                          fourthImage: image['data'][1]['images'][3]['image'],
                          imageSource: image['data'][1]['images'][0]['image'],
                          price: 'Rs${image['data'][1]['price']}',
                          mrp: 'Rs${image['data'][1]['mrp']}',
                          nameOfQuantity: '${image['data'][1]['name']}',
                          quantity: '${image['data'][1]['qty']}',
                          button: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      numberOfQuantity--;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    numberOfQuantity.toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // addingItem();
                                      numberOfQuantity++;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ReusableCardShownToUser(
                          firstImage: image['data'][2]['images'][0]['image'],
                          secondImage: image['data'][2]['images'][1]['image'],
                          thirdImage: image['data'][2]['images'][2]['image'],
                          fourthImage: image['data'][2]['images'][3]['image'],
                          imageSource: image['data'][2]['images'][0]['image'],
                          price: 'Rs${image['data'][2]['price']}',
                          mrp: 'Rs${image['data'][2]['mrp']}',
                          nameOfQuantity: '${image['data'][2]['name']}',
                          quantity: '${image['data'][2]['qty']}',
                          button: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      numberOfQuantity--;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    numberOfQuantity.toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // addingItem();
                                      numberOfQuantity++;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ReusableCardShownToUser(
                          firstImage: image['data'][3]['images'][0]['image'],
                          secondImage: image['data'][3]['images'][1]['image'],
                          thirdImage: image['data'][3]['images'][2]['image'],
                          fourthImage: image['data'][3]['images'][3]['image'],
                          imageSource: image['data'][3]['images'][0]['image'],
                          price: 'Rs${image['data'][3]['price']}',
                          mrp: 'Rs${image['data'][3]['mrp']}',
                          nameOfQuantity: '${image['data'][3]['name']}',
                          quantity: '${image['data'][3]['qty']}',
                          button: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      numberOfQuantity--;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    numberOfQuantity.toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // addingItem();
                                      numberOfQuantity++;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ReusableCardShownToUser(
                          firstImage: image['data'][4]['images'][0]['image'],
                          secondImage: image['data'][4]['images'][1]['image'],
                          thirdImage: image['data'][4]['images'][2]['image'],
                          fourthImage: image['data'][4]['images'][3]['image'],
                          imageSource: image['data'][4]['images'][0]['image'],
                          price: 'Rs${image['data'][4]['price']}',
                          mrp: 'Rs${image['data'][4]['mrp']}',
                          nameOfQuantity: '${image['data'][4]['name']}',
                          quantity: '${image['data'][4]['qty']}',
                          button: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      numberOfQuantity--;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    numberOfQuantity.toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // addingItem();
                                      numberOfQuantity++;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// String addingItem() {
//   int quantityOfItem;
//   int totalItem = quantityOfItem++;
//   return totalItem.toString();
// }

class ReusableCardShownToUser extends StatelessWidget {
  const ReusableCardShownToUser({
    Key key,
    @required this.imageSource,
    @required this.price,
    @required this.mrp,
    @required this.nameOfQuantity,
    @required this.quantity,
    @required this.button,
    @required this.firstImage,
    @required this.secondImage,
    @required this.thirdImage,
    @required this.fourthImage,
  }) : super(key: key);

  // final var image;

  final String imageSource;
  final String price;
  final String mrp;
  final String nameOfQuantity;
  final String quantity;
  final Widget button;
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;

//   @override
//   _ReusableCardShownToUserState createState() => _ReusableCardShownToUserState();
// }

// class _ReusableCardShownToUserState extends State<ReusableCardShownToUser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.grey[300],
        )),
        // height: double.infinity,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                // image['data'][0]['images'][0]['image'],
                imageSource,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // 'Rs${image['data'][0]['price']}',
                    price,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    // 'Rs${image['data'][0]['mrp']}',
                    mrp,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                // '${image['data'][0]['name']}',
                nameOfQuantity,
                style: TextStyle(
                  color: Colors.blueGrey,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  // decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                // '${image['data'][0]['qty']}',
                quantity,
                style: TextStyle(
                  color: Colors.blueGrey,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  // decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                // color: Colors.orange,
                // minWidth: 10.0,
                child: button,
                // onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SecondScreen(
                images: [
                  firstImage,
                  secondImage,
                  thirdImage,
                  fourthImage,
                ],
                nameOfItem: nameOfQuantity,
                mrp: mrp,
                currentPrice: price,
              );
            },
          ),
        );
      },
    );
  }
}

// class IncrementDecrementButtonWidget extends StatefulWidget {
//   @override
//   _IncrementDecrementButtonWidgetState createState() =>
//       _IncrementDecrementButtonWidgetState();
// }

// class _IncrementDecrementButtonWidgetState
//     extends State<IncrementDecrementButtonWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(FontAwesomeIcons.minus),
//             onPressed: null,
//           ),
//           Container(
//             child: Center(
//               child: Text(
//                 'Number',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }
