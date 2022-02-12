import 'package:flutter/material.dart';
import 'package:t20_wc/models/venue_model.dart';
import 'package:t20_wc/utile/venue_handler.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Venues',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,fontFamily: 'b'
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<VenueModel>>(
          future: VenueHandler.getAllVenues(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<VenueModel> venues = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: venues.length,
                  itemBuilder: (context, index) {
                    VenueModel venue = venues[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Country :${venue.country}',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,fontFamily: 'b'
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'City :${venue.city}',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,fontFamily: 'b'
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            venue.stadium,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,fontFamily: 'b'
                            ),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                venue.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
