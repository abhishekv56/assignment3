import 'dart:convert';
import 'package:http/http.dart' as http;

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