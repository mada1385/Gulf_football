class News {
  String title, content, image, tag;
  News(this.title, this.content, this.image, this.tag);
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json["title"],
      json["content"],
      json["image"],
      json["tag_name"],
    );
  }
}
