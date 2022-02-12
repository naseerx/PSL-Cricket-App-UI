
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t20_wc/models/venue_model.dart';

class VenueHandler{

  static Future<List<VenueModel>> getAllVenues(BuildContext context)async{
    await Future.delayed(const Duration(seconds: 2));

    var venue = <VenueModel>[];
    var assetsBundle = DefaultAssetBundle.of(context);
    var myJason = await assetsBundle.loadString('assets/data/ttwenty.json');
    var jsonData = json.decode(myJason);
    var venueJason = jsonData['venues'];
    for(var venuedata in venueJason){
      VenueModel venueData = VenueModel.fromJason(venuedata);
      venue.add(venueData);
    }

    return venue;
  }
}