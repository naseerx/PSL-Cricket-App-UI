import 'package:flutter/material.dart';
import 'package:t20_wc/models/match_model.dart';
import 'package:t20_wc/utile/match_handler.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Schedule',
            style: TextStyle(color: Colors.white,fontFamily: 'b',fontSize: 29),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<MatchMode>>(
          future: MatchHandler.getAllMatches(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<MatchMode> matches = snapshot.data;
              return ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  MatchMode mate = matches[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.purple,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          mate.date,
                          style: const TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'a'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/flags/${mate.flagOne}',
                                    height: 50,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  mate.teamOne,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17,fontFamily: 'b'),
                                ),
                              ],
                            ),
                            const Text(
                              'Vs',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'b'),
                            ),
                            Row(
                              children: [
                                Text(
                                  mate.teamTwo,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17,fontFamily: 'b'),
                                ),
                                const SizedBox(width: 10,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/flags/${mate.flagTwo}',
                                    height: 50,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          mate.venue,
                          style: TextStyle(color: Colors.white, fontSize: 28,fontFamily: 'd'),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: 40,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Group :${mate.group}',
                                    style: const TextStyle(color: Colors.white,fontSize: 19,fontFamily: 'e'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
