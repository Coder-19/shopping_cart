// import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

// the code below is for getting the data from the api

class Networking {
  Future<dynamic> getDetails() async {
    http.Response response = await http.get(
      'https://mini.ilmtechnosolutions.com/api/v1/products/desc',
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
