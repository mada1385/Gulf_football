class Leagues {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones
  final String leauge, id;

  Leagues(
    this.leauge,
    this.id,
  );

  factory Leagues.fromJson(Map<String, dynamic> json) {
    return Leagues(
      json["league_name"],
      json["league_id"],
    );
  }
}
