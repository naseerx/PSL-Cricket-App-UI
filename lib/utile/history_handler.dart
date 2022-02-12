import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_wc/models/history_model.dart';



class HistoryHandler {
  static Future<List<HistoryModel>> getAllHistory(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    var history = <HistoryModel>[];

    var assestbundle = DefaultAssetBundle.of(context);
    var jsonbundle = await assestbundle.loadString('assets/data/ttwenty.json');
    var jsondata = json.decode(jsonbundle);
    var historyjson = jsondata['history'];
    for (var historyData in historyjson) {
      HistoryModel historydata = HistoryModel.fromjson(historyData);
      history.add(historydata);
    }
    return history;
  }
}
