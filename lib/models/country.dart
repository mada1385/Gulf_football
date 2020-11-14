class Country {
  //here we will see the different data
  //you will find every thing you need in the doc
  //I'm not going to use every data, just few ones
  final String country, id;

  Country(
    this.country,
    this.id,
  );

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json["country_name"],
      json["country_id"],
    );
  }
}
