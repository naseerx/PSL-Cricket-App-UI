
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_wc/models/match_model.dart';

class MatchHandler{
  static Future<List<MatchMode>> getAllMatches(BuildContext context)async{
    await Future.delayed(const Duration(seconds: 3));
    var matche = <MatchMode>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var data = await assetsBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(data);
    var scheduleJson = jsonData['schedule'];
    for(var matchData in scheduleJson){
      MatchMode matchMode = MatchMode.fromJSON(matchData);
      matche.add(matchMode);
    }
    return matche;
  }
}