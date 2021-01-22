// import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;

// import 'package:shopping_cart/screens/second_screen.dart';
import 'package:shopping_cart/services/api_data.dart';
// import 'package:shopping_cart/services/networking.dart';
// import 'package:shopping_cart/services/products.dart';
// import 'package:shopping_cart/services/networking.dart';
// import 'package:shopping_cart/services/navigation_drawer.dart';
// import 'package:shopping_cart/services/networking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var image;

  String imageUrl;

  // creating an updateUI method here to get the specific values from the api
  Future updateUI() async {
    APIData apiData = APIData();
    try {
      var newData = await apiData.data();

      setState(() {
        if (newData == null) {
          imageUrl = 'error';
        } else {
          imageUrl = newData['data'][0]['images'][0]['image'];
          print(newData['data'][0]['images'][0]['image']);
          image = newData['data'][0]['name'];
          print(newData['data'][0]['name']);
        }
      });
    } catch (e) {
      print('The error is: $e');
    }
  }

  // Future<void> update() async {
  //   Products products = Products();

  //   var data = await products.updateUI();

  //   setState(() {
  //     if (data == null) {
  //       imageUrl = 'error';
  //     } else {
  //       imageUrl = data['data'][0]['images'][0]['image'];
  //       image = data['data'][0]['name'];
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();

    updateUI();

    // print(imageUrl);

    // print(image);
    // update();
  }

  @override
  Widget build(BuildContext context) {
    print('Inside of buid function: $imageUrl');
    print('Inside of the build function: $image');
    return Scaffold(
      body: Center(
        child: Container(
          // child: Text(imageUrl),
          // child: gettingData ? Text('Wait') : Text(imageUrl),
          child: image != null ? Text(image) : CircularProgressIndicator(),

          // child: FutureBuilder(
          //   future: updateUI(),
          //   builder: (context, snapshot) {
          //     var item;
          //     if (snapshot.hasData) {
          //       item = image;
          //     }
          //     // return Text(item);
          //   },
          // ),
        ),
      ),
    );
  }
}

// void updateUI() async {
//   APIData apiData = APIData();
//   // try {
//     var response = await apiData.data();
//     // print(response);
//     if (response != null) {
//       // print('inside if else block');
//       // var product = response['data'][0];
//       setState(() {
//         // imageUrl = product['images'][0]['image'];
//         // image = product['name'];

//       });
//       // print('ending of if else block');
//     } else {
//       // print('starting of else block');
//       print('Response was null');
//       imageUrl = 'error';
//     // }
//   // } catch (e) {
//     // print('error $e');
//   }
// }
