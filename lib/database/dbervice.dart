import 'dart:convert';

import 'package:http/http.dart';

class DatabaseService {
  Future getData(String fuelValue, String x, String y) async {
    try {
      Uri url = await Uri.http("hack4tkm.herokuapp.com", "/compute",
          {"fuel": "$fuelValue", "x": "$x", "y": "$y"});

      Response res = await post(url);
      print("result first" + res.body);
      //var RESULT = json.decode(res.body.toString());
      //print(RESULT["place"]);
      return res.body;
    } catch (e) {
      return null;
    }
  }
}
