class HistoryModel{

  String winner;
  String runnerup;
  String host;
  String winnerFlag;
  String runnerflag;
  String year;

  HistoryModel({
    required this.host,
    required this.winner,
    required this.runnerup,
    required this.winnerFlag,
    required this.runnerflag,
    required this.year
  });

  static HistoryModel fromjson(Map<String,dynamic>map){

    return HistoryModel(

        winner: map['winner'],
        runnerup: map['runnerUp'],
        host: map['host'],
        winnerFlag: map['winnerFlag'],
        runnerflag: map['runnerUpFlag'],
        year: map['year']
    );
  }
}