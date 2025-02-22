class NewsModel{
  String? title;
  String? description;
  String? author;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({this.title, this.description, this.author,this.urlToImage,this.publishedAt,this.content });

  factory NewsModel.fromMap(Map<String,dynamic> map) {
    return NewsModel(
      title: map['title'],
      description: map['description'],
      author: map['author'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }

}