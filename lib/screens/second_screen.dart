import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondScreen extends StatefulWidget {
  // creating a list below to show images
  final List images;

  // name of Item
  final String nameOfItem;

  final String mrp;
  final String currentPrice;

  // initializing the above properties using the dart constructor
  SecondScreen({
    @required this.images,
    @required this.nameOfItem,
    @required this.mrp,
    @required this.currentPrice,
  });

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int quantity = 0;

  // the function below is used to show the images

  Widget showImages() {
    for (int i = 1; i < widget.images.length; i + 1) {
      print('The usl of the image is: ${widget.images[i]}');
      print(i);

      return Image.network(
        widget.images[i],
        // scale: 120.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // try {
    //   print(widget.nameOfItem);
    // } catch (e) {
    //   print(e);
    // }
    // showImages();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1A2224),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.add_shopping_cart,
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            // child: Image.network(''),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: showImages(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.circle,
                      size: 10.0,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      FontAwesomeIcons.circle,
                      size: 10.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      FontAwesomeIcons.circle,
                      color: Colors.grey,
                      size: 10.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      FontAwesomeIcons.circle,
                      color: Colors.grey,
                      size: 10.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 18.0,
                    ),
                    height: 20.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5.0,
                        ),
                      ),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        '21% OFF',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.nameOfItem,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18.0,
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Product MRP: ',
                          style: TextStyle(
                            // decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.mrp,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Selling Price: ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(),
                            Text(
                              '${widget.currentPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 18.0,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '(Inclusive of all Taxes)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 138.0,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          child: Row(
                            children: [
                              Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          color: Color(0xFFE76228),
                          onPressed: () {
                            // quantity++;
                            print('${quantity++}');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEDFBFC),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      Image.asset(
                        'assets/images/img.PNG',
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        'Rs 256.0',
                        style: TextStyle(
                          color: Color(0xFF45A1A9),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        '${widget.currentPrice}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 180.0,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.lock,
                            size: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Unit',
                      style: TextStyle(
                        color: Color(0xFF737373),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 18.0,
                      ),
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.red,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '10 Kg',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 18.0,
                      ),
                      padding: EdgeInsets.all(
                        8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '5 Kg',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  color: Color(0xFFFCF9E6),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Image.asset(
                        'assets/images/img.PNG',
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Lowest Prices',
                              style: TextStyle(
                                color: Color(
                                  0xFF63AA3E,
                                ),
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Become club member at Rs79',
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 45.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFE96125),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
