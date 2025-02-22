import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Models/news_model.dart';

class WeatherService {

  final apiKey= 'd710dc8b35dba003d37c6ab13e3c8be8';
  final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {

   final response= await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));

   if(response.statusCode==200){
    return jsonDecode(response.body);
   }
   else
     {
      throw Exception('Failed to load weather details');
     }
  }

}


// class NewsService{
//
//   Future<List<NewsModel>> fetchNews() async{
//     final res= await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=399c1dbe84d8444292be40fc14d836ab'));
//     if(res.statusCode==200){
//       final json=jsonDecode(res.body);
//       List<dynamic> newsArticles= json['articles'];
//       List<NewsModel> actualNewsList = newsArticles.map((item) => NewsModel.fromMap(item)).toList();
//       print(actualNewsList);
//       return actualNewsList;
//     }
//     else{
//      throw Exception('Falied to load the News');
//     }
//   }
//
// }
