import 'package:flutter/material.dart';
import 'package:t20_wc/models/teams_model.dart';
import 'package:t20_wc/utile/teams_handler.dart';

class TeamsScreen extends StatelessWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Teams',
              style: TextStyle(
                fontSize: 29,
                color: Colors.white,fontFamily: 'a'
              ),
            ),
          ),
        ),
        body: FutureBuilder<List<TeamsModel>>(
            future: TeamsHandler.getAllTeams(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<TeamsModel> teams = snapshot.data;
                return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    TeamsModel team = teams[index];
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.purple),
                        child: Row(
                          children: [
                            SizedBox(width: 25,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                team.flag,
                                width: 90,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text(
                              team.fullName,
                              style: TextStyle(
                                fontSize: 29,
                                color: Colors.white,fontFamily: 'c'
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
