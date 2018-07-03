class Feed
{
  String fid;
  String author;
  String title;
  String url;
  String platform;
  String postdate;

  Feed({this.author , this.title , this.postdate , this.fid , this.url , this.platform});

  factory Feed.fromJson(Map<String , dynamic> json){
    return new Feed(author: json['author'],
    title: json['title'],
    postdate: json['postdate'],
    fid: json['fid'],
    url: json['url'],
    platform: json['platform'],);
  }
}