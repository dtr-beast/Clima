import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String API_KEY = 'ea0773dd96fe428f5f1c7ec24ca3e38f';

class Network {
  Network({@required this.latitude, @required this.longitude});

  double latitude, longitude;

  Future<List> getData() async {
    http.Response response =
        await http.get('https://api.openweathermap.org/data/2.5/weather?'
            'lat=$latitude'
            '&lon=$longitude'
            '&units=metric'
            '&appid=$API_KEY');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return [data['main']['temp'].round(), data['name']];
    }
    return [];
  }
}
