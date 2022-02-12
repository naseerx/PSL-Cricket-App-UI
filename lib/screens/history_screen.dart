import 'package:flutter/material.dart';
import 'package:t20_wc/models/history_model.dart';
import 'package:t20_wc/utile/history_handler.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'History Winners',
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,fontFamily: 'b'
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<HistoryModel>>(
        future: HistoryHandler.getAllHistory(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<HistoryModel> history = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    HistoryModel histor = history[index];
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
                            height: 8,
                          ),
                          Text('Hosted By ${histor.host} (${histor.year})',

                            style: const TextStyle(
                                color: Colors.white, fontSize: 20,fontFamily: 'b'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Winner',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,fontFamily: 'a'
                                ),
                              ),
                              Text(
                                'RunnerUp',
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,fontFamily: 'a'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/flags/${histor.winnerFlag}',
                                      height: 50,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    histor.winner,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 19,fontFamily: 'b'),
                                  ),
                                ],
                              ),
                              const Text(
                                'Vs',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19,fontFamily: 'b'),
                              ),
                              Row(
                                children: [
                                  Text(
                                    histor.runnerup,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 19,fontFamily: 'b'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/flags/${histor.runnerflag}',
                                      height: 50,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
