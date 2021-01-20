// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

// the code below is for getting the data from the api

class Networking {
  Future getDetails() async {
    http.Response response = await http.get(
      'https://mini.ilmtechnosolutions.com/api/v1/products/desc',
    );

    // storing the data in a variable
    // var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return 'error';
    }

    
  }
}
