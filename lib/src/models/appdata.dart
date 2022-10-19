import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get(
        Uri.parse('https://luk3dcloud.com/gelatoonice/public/api/icecream/'));

    if (res.statusCode == 200) {
      setData(jsonDecode(res.body).cast);
      return true;
    } else {
      return false;
    }
  }
}
