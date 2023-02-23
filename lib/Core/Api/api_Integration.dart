import 'dart:convert';

import 'package:Ninja/Core/Api/model.dart';
import 'package:flutter/services.dart';

class LocalJson {
  Future<AppleModel> iphone() async {
    final String response = await rootBundle.loadString('json/data.json');
    final Idata = await json.decode(response);

    return AppleModel.fromJson(Idata);
  }

  Future<SamsungModel> samsungphone() async {
    final String response = await rootBundle.loadString('json/samsungApi.json');
    final Sdata = await json.decode(response);

    return SamsungModel.fromJson(Sdata);
  }
}

class Xiamilocal {
  Future xaimiphone() async {
    final String response = await rootBundle.loadString('json/X.json');
    final data = await json.decode(response);

    return data;
  }
}
