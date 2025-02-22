import 'dart:convert';

import 'package:assignment3/Models/news_model.dart';
import 'package:assignment3/news_content_screen.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  List<NewsModel> news = [];

  Future<List<NewsModel>> fetchNews() async {
    final res = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=399c1dbe84d8444292be40fc14d836ab'));
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      List<dynamic> newsArticles = json['articles'];
      List<NewsModel> actualNewsList = newsArticles.map((e) =>
          NewsModel.fromMap(e)).toList();
      news = actualNewsList;
      return news;
    }
    else {
      throw Exception('Falied to load the News');
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: const Center(
                child: Text('Loading....'),
              ),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = news[index];
                // return ListTile(
                //   title: Text(data.title!),
                //   leading: data.urlToImage!=null
                //       ? Image(image: NetworkImage(data.urlToImage!))
                //           :Text('no image'),
                // );
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> NewsContent(news: data)));
                    },
                    child: Card(
                      elevation: 20,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data.urlToImage!=null ? Image(image: NetworkImage(data.urlToImage!)) :Container(height: 200,child: Center(child: Text('unable to load image')),),
                            Text(data.title!,style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 15,),
                            Text('Published: ${data.publishedAt}')

                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
          );
        }
    );
  }
}
