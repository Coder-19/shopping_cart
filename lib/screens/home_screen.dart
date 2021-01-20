import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

// import 'package:shopping_cart/screens/second_screen.dart';
import 'package:shopping_cart/services/api_data.dart';
import 'package:shopping_cart/services/networking.dart';
// import 'package:shopping_cart/services/navigation_drawer.dart';
// import 'package:shopping_cart/services/networking.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var image;

  String imageUrl;

  int numberOfQuantity = 0;

  bool gettingData = false;

  // Future getDetails() async {
  //   http.Response response = await http.get(
  //     'https://mini.ilmtechnosolutions.com/api/v1/products/desc',
  //   );

  //   // storing the data in a variable
  //   // var data = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print('The current data is: $data');

  //     return data;
  //   } else {
  //     print('error');
  //     return 'error';
  //   }
  // }

  // Future<dynamic> data() async {
  //   // creating an instance of Networking class here
  //   Networking networking = Networking();
  //   var apiData = await networking.getDetails();

  //   print('The data is: $apiData');
  //   return apiData;
  // }

  // creating an updateUI method here to get the specific values from the api
  dynamic updateUI() async {
    APIData apiData = APIData();
    try {
      var newData = await apiData.data();

      // print(newData);
      // imageUrl = newData['data'][0]['images'][0]['image'];

      setState(() {
        if (newData == null) {
          imageUrl = 'error';
        } else {
          // try {
          imageUrl = newData['data'][0]['images'][0]['image'];
          image = newData['data'][0]['name'];
          // } catch (e) {
          //   print(e);
          // }
        }
      });
    } catch (e) {
      print(e);
    }

    // return newData;

    // image = newData['data']['store_id'];
  }

  // void update() async {
  //   var api =  await updateUI();

  //   setState(() {
  //     if (api == null) {
  //       imageUrl = 'error';
  //     } else {
  //       imageUrl = api['data'][0]['images'][0]['image'];
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // getDetails();

    updateUI();

    // update();

    // print(apiData.getDetails());

    // data();
  }

  @override
  Widget build(BuildContext context) {
    // print(imageUrl);

    print(image);
    return Scaffold(
      body: Center(
        child: Container(
          // child: gettingData ? Text('Wait') : Text(imageUrl),
          child: image != null ? Text(image) : Text('error'),
        ),
      ),
    );
  }
}
