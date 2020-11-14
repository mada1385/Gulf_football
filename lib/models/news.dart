class News {
  String title, content, image;
  News(this.title, this.content, this.image);
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json["title"],
      json["content"],
      json["image"],
    );
  }
}
