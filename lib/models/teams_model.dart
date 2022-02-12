class TeamsModel{
  String fullName;
  String shortName;
  String flag;

  TeamsModel({
    required this.fullName,
    required this.shortName,
    required this.flag
  });
  static TeamsModel fromJson(Map<String,dynamic>map){

    return TeamsModel(
        fullName: map['fullName'],
        shortName: map['shortName'],
        flag: map['flag']
    );
  }
}