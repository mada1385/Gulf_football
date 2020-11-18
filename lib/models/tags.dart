class Tags {
  String tag, id;

  Tags(this.tag, id);
  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      json["tag"],
      json["_id"].toString(),
    );
  }
}
