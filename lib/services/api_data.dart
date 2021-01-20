// the code below is for getting the JSON data that we got from the api

import 'package:shopping_cart/services/networking.dart';

class APIData {
  Future<dynamic> data() async {
    // creating an instance of Networking class here
    Networking networking = Networking();
    var apiData = await networking.getDetails();
    return apiData;
  }
}
