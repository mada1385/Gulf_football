class SoccerMatch {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones

  Fixture fixture;
  HomeTeam home;
  AwayTeam away;
  Goal goal;
  Matchstats stats;
  Lineup lineup;

  SoccerMatch(
      this.fixture, this.home, this.away, this.goal, this.stats, this.lineup);

  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
        Fixture.fromJson(json),
        HomeTeam.fromJson(json),
        AwayTeam.fromJson(json),
        Goal.fromJson(json),
        Matchstats.fromJson(json),
        Lineup.fromJson(json));
  }
}

//here we will store the fixture
class Fixture {
  String id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['match_id'], json['match_date'], Status.fromJson(json));
  }
}

//here we will store the Status
class Status {
  String status;
  String league;

  Status(this.status, this.league);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['match_status'], json["league_name"]);
  }
}

//here we will store the Team data
class HomeTeam {
  String id;
  String name;
  String logoUrl;
  // bool winner;
  HomeTeam(
    this.id,
    this.name,
    this.logoUrl,
    //  this.winner
  );

  factory HomeTeam.fromJson(Map<String, dynamic> json) {
    return HomeTeam(
      json['match_hometeam_id'], json['match_hometeam_name'],
      json['team_home_badge'],
      // json['winner']
    );
  }
}

class AwayTeam {
  String id;
  String name;
  String logoUrl;
  // bool winner;
  AwayTeam(
    this.id,
    this.name,
    this.logoUrl,
    //  this.winner
  );

  factory AwayTeam.fromJson(Map<String, dynamic> json) {
    return AwayTeam(
      json['match_awayteam_id: 2617'], json['match_awayteam_name'],
      json['team_away_badge'],
      // json['winner']
    );
  }
}

//here we will store the Goal data
class Goal {
  String home;
  String away;
  Goal(this.home, this.away);

  //Now we will create a factory method to copy the data from
  // the json file
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['match_hometeam_score'], json['match_awayteam_score']);
  }
}

class Matchstats {
  List stats;

  Matchstats(this.stats);
  factory Matchstats.fromJson(Map<String, dynamic> json) {
    return Matchstats(json["statistics"]);
  }
}

class Lineup {
  List lineuphome;
  List lineupaway;
  List subshome;
  List subsaway;
  String formationhome;
  String formationaway;

  Lineup(this.lineuphome, this.lineupaway, this.subshome, this.subsaway,
      this.formationhome, this.formationaway);
  factory Lineup.fromJson(Map<String, dynamic> json) {
    return Lineup(
        json["lineup"]["home"]["starting_lineups"],
        json["lineup"]["away"]["starting_lineups"],
        json["lineup"]["home"]["substitutes"],
        json["lineup"]["away"]["substitutes"],
        json["match_hometeam_system"],
        json["match_awayteam_system"]);
  }
}
