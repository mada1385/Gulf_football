class Teams {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones
  final String teamname, id, teambadge;

  Teams(this.teamname, this.teambadge, this.id);

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      json["team_name"],
      json["team_badge"],
      json["team_key"],
    );
  }
}
