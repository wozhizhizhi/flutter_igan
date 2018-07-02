class AIModle {
  final String desc;
  final List images;
  final String publishedAt;
  final String url;
  final String who;

  AIModle({this.desc, this.images, this.publishedAt, this.url, this.who});
  factory AIModle.fromJson(Map<String, dynamic> json) {
    return new AIModle(
      desc: json['desc'],
      images: json['images'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      who: json['who'],
    );
  }
}
