import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_wc/models/teams_model.dart';

class TeamsHandler{
  static Future<List<TeamsModel>> getAllTeams(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    var teams =<TeamsModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var myjson = await assetsBundle.loadString('assets/data/ttwenty.json');
    var jsondata = json.decode(myjson);
    var teamsjson = jsondata['teams'];
    for(var jsonteams in teamsjson){

      TeamsModel teamsdata = TeamsModel.fromJson(jsonteams);
      teams.add(teamsdata);
    }
    return teams;

  }
}