

import '../SourcesResponse/Source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Brenda Stolyar, Gear Team"
/// title : "Best Kindle Cyber Monday Deals and Amazon Device Sales (2024)"
/// description : "These are the best Kindle Cyber Monday deals. Snag discounts on the new e-reader lineup, and other deals on Fire HD tablets, Fire TV Sticks, Eero routers, and Ring cameras."
/// url : "https://www.wired.com/story/cyber-monday-amazon-devices-deals-2024/"
/// urlToImage : "https://media.wired.com/photos/6740fbaafe9c6f429dad5e1a/191:100/w_1280,c_limit/Black%20Friday%20Amazon%20Device%20Deals%20Abstract%20Background%20112024%20Source%20Amazon.jpg"
/// publishedAt : "2024-12-02T13:34:21Z"
/// content : "Thanksgiving is over and the Kindle Cyber Monday deals have arrived. Yes, and I mean the brand-new Kindle lineup of e-readers Amazon announced last month. Not only that but other WIRED-approved Amazo… [+13703 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}