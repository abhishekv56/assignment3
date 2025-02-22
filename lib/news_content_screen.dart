import 'package:assignment3/Models/news_model.dart';
import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {

  final NewsModel news;
  const NewsContent({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Content'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Author: ${news.author}'),
              SizedBox(height: 10,),
              news.urlToImage!=null ? Image(image: NetworkImage(news.urlToImage!)) :Container(height: 200, width: 200,child: Text('unable to load image'),),
              Text('${news.title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('${news.description}'),
            ],
          ),
        ),
      ),
    );
  }
}
